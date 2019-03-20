using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;

namespace Bearing
{
    /// <summary>
    /// MainWindow.xaml 的互動邏輯
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        #region 各種參數

        //輸入
        public int C0; //額定靜負荷
        public int Cs; //額定動負荷
        public int i; //軸承個數
        public double Ka; //軸向力
        public double Fv; //預壓力
        public int Rpm;//轉速
        public double Fr; //徑向負荷
        public int Dm;//節圓直徑
        public double V1;//參考黏度
        public double Aiso;//壽命調整係數

        //輸出
        public double Fa; //軸向負荷
        public double X;//徑向係數
        public double Y;//軸向係數
        public double P;//徑向當量動負荷
        public double C;//額定動負荷

        public double[,] Ec = new double[2, 7] { { 1,0.7,0.55,0.4,0.2,0.05,0},{1,0.85,0.75,0.5,0.3,0.05,0 } };//汙染係數參數

        //參考值
        public double[] A_15 = new double[9] { 0.015, 0.029, 0.058, 0.087, 0.12, 0.17, 0.29, 0.44, 0.58 };
        public double[] Aee = new double[9] { 0.38, 0.4, 0.43, 0.46, 0.47, 0.5, 0.55, 0.56, 0.56 };
        public double[,] A_15X = new double[2, 2] { { 1, 0.44 }, { 1, 0.72 } };
        public double[,,] A_15Y = new double[2, 2, 9] { { { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 1.47, 1.4, 1.3, 1.23, 1.19, 1.12, 1.02, 1, 1 } },
                                                        { { 1.65, 1.57, 1.46, 1.38, 1.34, 1.26, 1.14, 1.12, 1.12 }, { 2.39, 2.28, 2.11, 2, 1.93, 1.82, 1.66, 1.63, 1.63 } } };

        //XY參數
        public double[,,] A_20 = new double[2, 2, 2] { { { 1, 0 }, { 0.43, 1 } }, { { 1, 1.09 }, { 0.7, 1.63 } } };
        public double[,,] A_25 = new double[2, 2, 2] { { { 1, 0 }, { 0.41, 0.87 } }, { { 1, 0.92 }, { 0.67, 1.41 } } };

        public double[] DG = new double[9] { 0.014, 0.028, 0.056, 0.085, 0.11, 0.17, 0.28, 0.42, 0.56 };
        public double[] DGee = new double[9] { 0.23, 0.26, 0.3, 0.34, 0.36, 0.4, 0.45, 0.5, 0.52 };
        public double[,] DGX = new double[2, 2] { { 1, 0 }, { 1, 0.78 } };
        public double[,,] DGY = new double[2, 2, 9] { { { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 2.3, 1.99, 1.71, 1.55, 1.45, 1.31, 1.15, 1.04, 1 } },
                                                      { { 2.78, 2.4, 2.07, 1.87, 1.75, 1.58, 1.39, 1.26, 1.21 }, { 3.74, 3.23, 2.78, 2.52, 2.36, 2.13, 1.87, 1.69, 1.63 } } };

        //失效概率
        public double[] A1 = new double[6] { 0.25, 0.37, 0.47, 0.55, 0.64, 1 };
        //最大運行溫度
        public double[] Ft = new double[4] { 1, 0.73, 0.42, 0.22 };

        #endregion



        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            load();
            checkornot(false, -1);
            Chart.Source = new BitmapImage(new Uri(@"resource/p1p2.png", UriKind.Relative));
        }
        
        private void load() //將所有輸入帶入
        {
            C0 = Int32.Parse(c0.Text);
            Cs = Int32.Parse(c_single.Text);
            i = Int32.Parse(i_nofb.Text);
            Ka = Int32.Parse(ka.Text);
            Fv = Int32.Parse(fv.Text);
            Rpm = Int32.Parse(rpm.Text);
            Fr = Int32.Parse(fr.Text);
            Dm = Int32.Parse(dm.Text);
            V1 = Int32.Parse(v1.Text);
            Aiso = float.Parse(life_p.Text);
        }

        private void Calculate() //所有的計算
        {
            load();
            F_calculate();
            C_calculate();
            X_Y_calculate();
            P_calculate();
            Life_calculate();
            Life_year.Text= Year_calculate(Int32.Parse(life.Text)).ToString();
            if (uselife2.IsChecked ==true)
            {
                life2.Text=Math.Round(Life2_calculate(Int32.Parse(life.Text)),0).ToString();

                Life_year.Text = Year_calculate(Int32.Parse(life2.Text)).ToString();
            }
        }


        private void F_calculate() //軸向負荷計算
        {
            if (Ka > 3 * Fv)
            {
                Fa = Ka;
            }
            else
            {
                Fa = Fv + 0.67 * Ka;
            }
            fa.Text = Math.Round(Fa, 0).ToString();
        }

        private void C_calculate() //額定動負荷計算
        {
            C = Math.Round((Math.Pow(i, 0.7) * Cs), 2);
            c.Text = Math.Round(C, 2).ToString();
        }

        private void P_calculate() //當量的軸承負荷計算
        {
            P = X * Fr + Y * Fa;
            p.Text = P.ToString();
        }
        
        private void X_Y_calculate() //XY係數
        {
            double parameter = i * Fa / C0;

            if (bearing.SelectedIndex == 0) //主軸軸承
            {
                if (angle.SelectedIndex == 0) //15度接觸角計算
                {
                    double XX;
                    double YY;

                    C15(parameter, out XX, out YY);

                    X = XX;
                    Y = YY;
                }
                else if (angle.SelectedIndex == 1)//20度接觸角計算
                {
                    int p1 = b_con.SelectedIndex; //第一維:配置
                    int p2;
                    if (Fa / Fr <= 0.57) { p2 = 0; } else { p2 = 1; }//第二維:參數

                    X = A_20[p1, p2, 0];   //第三維第一項:X
                    Y = A_20[p1, p2, 1]; //第三維第二項:Y
                }
                else //25度接觸角計算
                {
                    int p1 = b_con.SelectedIndex;
                    int p2;
                    if (Fa / Fr <= 0.68) { p2 = 0; } else { p2 = 1; }

                    X = A_25[p1, p2, 0];
                    Y = A_25[p1, p2, 1];
                }
            }
            else //深溝軸承
            {
                double XX;
                double YY;

                DGcal(parameter, out XX, out YY);

                X = XX;
                Y = YY;
            }
            x.Text = X.ToString();
            y.Text = Y.ToString();
        }

        private void C15(double parameter, out double XX, out double YY) //15度接觸角計算
        {
            //抓出最接近的數字
            double min = 999;
            int kk = 0;
            for (int i = 0; i < 9; i++)
            {
                if (Math.Abs(parameter - A_15[i]) < min)
                {
                    min = Math.Abs(parameter - A_15[i]);
                    kk = i;
                }
            }
            //抓出ee值
            double ee = Aee[kk];

            int p1 = b_con.SelectedIndex;//軸承配置
            int p2;
            if (Fa / Fr <= ee) { p2 = 0; } else { p2 = 1; }//大小
            XX = A_15X[p1, p2];
            YY = A_15Y[p1, p2, kk];
        }

        public void DGcal(double parameter, out double XX, out double YY)  //深溝軸承計算
        {
            //抓出最接近的數字
            double min = 999;
            int kk = 0;
            for (int i = 0; i < 9; i++)
            {
                if (Math.Abs(parameter - DG[i]) < min)
                {
                    min = Math.Abs(parameter - DG[i]);
                    kk = i;
                }
            }
            //抓出ee值
            double ee = DGee[kk];

            int p1 = b_con.SelectedIndex;//軸承配置
            int p2;
            if (Fa / Fr <= ee) { p2 = 0; } else { p2 = 1; }//大小
            XX = DGX[p1, p2];
            YY = DGY[p1, p2, kk];
        }

        private double Year_calculate( double hour)  //壽命換算時間
        {
            double p1 = Int32.Parse(Hour_day.Text);
            double p2 = Int32.Parse(Day_year.Text);
            return Math.Round(hour / p1 / p2, 2);
        }
        private void Life_calculate() //額定壽命計算
        {
            life.Text = Math.Round(1000000 / 60 / Rpm * Math.Pow(C / P, 3), 0).ToString();
        }


        private double Life2_calculate(double time) //延長壽命計算
        {
            return time * Aiso * Ft[Tempture.SelectedIndex] * A1[lost_chance.SelectedIndex];
        }

        private void k_calculate() //黏度比計算
        {
            double p1 = Math.Log(Int32.Parse(v40.Text) / Int32.Parse(v100.Text), Math.E);
            double p2 = (1948.1 / (Int32.Parse(tb.Text) + 273) - 6.22);
            double p3 = Math.Pow(Math.E, p2 * p1);
            double v = Int32.Parse(v40.Text) * p3;

            k.Text = Math.Round((v / Int32.Parse(v1.Text)), 1).ToString();
        }
        private void aiso_calculate() //調整係數計算
        {
            double cu;
            double ec;
            if (Dm <= 100)
            {
                cu = C0 / 22;
                ec = Ec[0, clean.SelectedIndex];
            }
            else
            {
                cu = C0 / 22 * Math.Pow(100 / Dm, 0.5);
                ec = Ec[1, clean.SelectedIndex];
            }
            eccup.Text = Math.Round((ec * cu / P), 2).ToString();


        }
        
        //確認是否使用延長壽命
        private void checkornot(bool b,int s)
        {
            lost_chance.IsEnabled = b;
            lost_chance.SelectedIndex = s;
            Tempture.IsEnabled = b;
            Tempture.SelectedIndex = s;

            Tempture.SelectedIndex = s;
            clean.IsEnabled = b;
            clean.SelectedIndex = s;
            life_p.IsEnabled = b;
            life_p.Text = "1";
        }
        //顯示圖片
        private void showimg(string name)
        {
            string route = Directory.GetCurrentDirectory() + "\\resource" + "\\"+name;

            FileStream fstream = new FileStream(route, FileMode.Open);
            BitmapImage bitmap = new BitmapImage();
            bitmap.BeginInit();
            bitmap.StreamSource = fstream;
            bitmap.CacheOption = BitmapCacheOption.OnLoad;
            bitmap.EndInit();
            fstream.Close();

            Chart.BeginInit();
            Chart.Source = bitmap;
            Chart.EndInit();
        }


        #region 按鈕

        //係數按鈕
        private void P_pic_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/p1p2.png", UriKind.Relative));
        }

        private void AisoC_btm_Click(object sender, RoutedEventArgs e)
        {
            k_calculate();
            aiso_calculate();
        }

        //計算按鈕
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Calculate();
        }

        //顯示壽命係數圖表
        private void Aiso_btm_Click(object sender, RoutedEventArgs e)
        {
            //showimg("aiso.png");
            Chart.Source = new BitmapImage(new Uri(@"resource/aiso.png", UriKind.Relative));

        }
        
        //啟用與停用壽命延長
        private void Uselife2_Checked(object sender, RoutedEventArgs e)
        {
            checkornot(true, 0);
        }

        private void Uselife2_Unchecked(object sender, RoutedEventArgs e)
        {
            checkornot(false, -1);
        }

        //換接觸角
        private void Angle_DropDownClosed(object sender, EventArgs e)
        {
            Calculate();
        }
        //換軸承配置
        private void B_con_DropDownClosed(object sender, EventArgs e)
        {
            Calculate();
        }
        //換軸承型式
        private void Bearing_DropDownClosed(object sender, EventArgs e)
        {
            if (bearing.SelectedIndex == 0)
            {
                angle.IsEnabled = true;
                angle.SelectedIndex = 0;
            }
            else
            {
                angle.IsEnabled = false;
                angle.SelectedIndex = -1;
            }

            Calculate();
        }

        //顯示壽命公式
        private void Life1_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/L10.png", UriKind.Relative));
        }
        //顯示延長壽命公式
        private void Life2_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/Lnm.png", UriKind.Relative));
        }
        private void Fa_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/P.png", UriKind.Relative));
        }
        private void V1_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/v1.png", UriKind.Relative));
        }
        #endregion

        


        #region //初始化

        private void A_length_GotFocus(object sender, RoutedEventArgs e)
        {
            A_length.Text = "";
        }

        private void B_length_GotFocus(object sender, RoutedEventArgs e)
        {
            B_length.Text = "";
        }

        private void C_length_GotFocus(object sender, RoutedEventArgs e)
        {
            C_length.Text = "";
        }

        private void P1_force_GotFocus(object sender, RoutedEventArgs e)
        {
            P1_force.Text = "";
        }

        private void P2_force_GotFocus(object sender, RoutedEventArgs e)
        {
            P2_force.Text = "";
        }
        #endregion

        #region //負荷計算
        private void Force_btm_Click(object sender, RoutedEventArgs e)
        {
            P1P2_calculate();
        }
        private void P1P2_calculate()
        {
            double a = Int32.Parse(A_length.Text);
            double b = Int32.Parse(B_length.Text);
            double c = Int32.Parse(C_length.Text);
            double p1 = Int32.Parse(P1_force.Text);
            double p2 = Int32.Parse(P2_force.Text);

            double bforce = (-p1 * (a + b) + p2 * c) / b; //前軸承
            double b1force = (p1 * a - p2 * (b + c)) / b; //後軸承

            fr.Text = Math.Round(bforce, 2).ToString();
            fr1.Text = Math.Round(b1force, 2).ToString();
        }

        #endregion

        
    }
}
