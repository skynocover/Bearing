﻿using System;
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
        //將前後負荷變成全域變數
        //前後負荷在使用時要變成ABS
        //函數帶入數值而非寫死
        //注意黏度v1可能需要兩個
        //確認是否使用延長壽命 可能有問題
        #region 宣告
        
        //共用輸入
        public int Rpm;//轉速
        public double Ka; //軸向力

        public int Hours;//一天使用時數
        public int Days;//一年使用天數
        
        //共用輸出
        public double Aiso;//壽命調整係數

        //前軸承輸入
        public int Cs; //額定動負荷
        public int i; //軸承個數
        public double Fv; //預壓力
        //前軸承輸出
        public double C;//額定動負荷
        public double Fa; //軸向負荷
        public double X;//徑向係數
        public double Y;//軸向係數
        public double P_1;//徑向當量動負荷



        //後軸承輸入

        //後軸承輸出

        #endregion

        #region 參數

        //失效概率
        public double[] A1 = new double[6] { 0.25, 0.37, 0.47, 0.55, 0.64, 1 };
        //最大運行溫度
        public double[] Ft = new double[4] { 1, 0.73, 0.42, 0.22 };
        //汙染係數
        public double[,] Ec = new double[2, 7] { { 1,0.7,0.55,0.4,0.2,0.05,0},{1,0.85,0.75,0.5,0.3,0.05,0 } };

        //參考值
        public double[] A_15 = new double[9] { 0.015, 0.029, 0.058, 0.087, 0.12, 0.17, 0.29, 0.44, 0.58 };
        public double[] DG = new double[9] { 0.014, 0.028, 0.056, 0.085, 0.11, 0.17, 0.28, 0.42, 0.56 };

        //e值
        public double[] Aee = new double[9] { 0.38, 0.4, 0.43, 0.46, 0.47, 0.5, 0.55, 0.56, 0.56 };
        public double[] DGee = new double[9] { 0.23, 0.26, 0.3, 0.34, 0.36, 0.4, 0.45, 0.5, 0.52 };

        //XY參數
        public double[,] A_15X = new double[2, 2] { { 1, 0.44 }, { 1, 0.72 } };
        public double[,,] A_15Y = new double[2, 2, 9] { { { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 1.47, 1.4, 1.3, 1.23, 1.19, 1.12, 1.02, 1, 1 } },
                                                        { { 1.65, 1.57, 1.46, 1.38, 1.34, 1.26, 1.14, 1.12, 1.12 }, { 2.39, 2.28, 2.11, 2, 1.93, 1.82, 1.66, 1.63, 1.63 } } };
        public double[,,] A_20 = new double[2, 2, 2] { { { 1, 0 }, { 0.43, 1 } }, { { 1, 1.09 }, { 0.7, 1.63 } } };
        public double[,,] A_25 = new double[2, 2, 2] { { { 1, 0 }, { 0.41, 0.87 } }, { { 1, 0.92 }, { 0.67, 1.41 } } };
        public double[,] DGX = new double[2, 2] { { 1, 0 }, { 1, 0.78 } };
        public double[,,] DGY = new double[2, 2, 9] { { { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 2.3, 1.99, 1.71, 1.55, 1.45, 1.31, 1.15, 1.04, 1 } },
                                                      { { 2.78, 2.4, 2.07, 1.87, 1.75, 1.58, 1.39, 1.26, 1.21 }, { 3.74, 3.23, 2.78, 2.52, 2.36, 2.13, 1.87, 1.69, 1.63 } } };
        #endregion



        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            load(); //載入參數
            checkornot(false, -1); //不使用check
            Chart.Source = new BitmapImage(new Uri(@"resource/p1p2.png", UriKind.Relative)); //中央圖片載入
        }
        
        private void load() //將所有輸入載入
        {
            //共用
             Rpm = Int32.Parse(rpm.Text);//轉速
             Ka = Int32.Parse(ka.Text); //軸向力
            

            

            //後軸承

        }

        private void Calculate() //所有的計算
        {
            load(); //載入參數

            //輸入參數
            double fv_1 = Int32.Parse(fv.Text); //預壓力
            double cs_1 = Int32.Parse(c_single.Text); //單顆額定動負荷
            int i_1 = Int32.Parse(i_nofb.Text); //軸承個數
            double c0_1 = Int32.Parse(c0.Text);//靜負荷
            int b_1 = b_con.SelectedIndex;
            int a_1 = angle.SelectedIndex;
            double fr_1 =Math.Abs( Int32.Parse(fr.Text));
            

            //輸出用參數
            double fa_1;
            double c_1;
            double x_1;
            double y_1;
            double life_1;
            double year_1;
            

            //前軸承計算
            fa_1 =  F_calculate(Ka,fv_1); //軸向負荷計算
            c_1 =C_calculate(i_1, cs_1); //額定動負荷計算
            X_Y_calculate(i_1,fa_1,c0_1,b_1, a_1, fr_1,out x_1,out y_1); //XY係數計算
            P_1 = P_calculate(x_1,y_1,fr_1,fa_1); //當量軸承負荷計算
            life_1=Life_calculate(c_1, P_1); //額定壽命計算
            year_1 = Year_calculate(life_1); //換算年

            p.Text = Math.Round(P_1, 2).ToString();//輸出當量動負荷
            life.Text = Math.Round(life_1, 0).ToString();//輸出壽命小時
            if (uselife2.IsChecked ==true) //輸出小時
            {
                double aiso = Int32.Parse(life_p.Text);
                double life2_1 =life_1 * aiso * Ft[Tempture.SelectedIndex] * A1[lost_chance.SelectedIndex];
                year_1 = Year_calculate(life2_1);
                life2.Text = Math.Round(life2_1, 0).ToString();
            }
            else{ }
            Life_year.Text = Math.Round(year_1, 2).ToString();
        }
       


        private void Aiso_calculate() //壽命調整係數計算
        {
            //輸入
            double v1_1 = Int32.Parse(v1.Text); //前軸承參考黏度            
            double dm_1 = Int32.Parse( dm.Text); //前軸承dm
            double c0_1 = Int32.Parse(c0.Text); //前軸承靜負荷
            //計算
            double k_1 = k_calculate(v1_1); //黏度比計算
            double eccup_1 = eccup_calculate(dm_1, c0_1, P_1); //前軸承eccup計算
            //顯示
            k.Text = Math.Round(k_1, 2).ToString();
            eccup.Text = Math.Round(eccup_1, 2).ToString();
        }

        private double k_calculate(double v1) //黏度比計算
        {
            double p1 = Math.Log(Int32.Parse(v40.Text) / Int32.Parse(v100.Text), Math.E);
            double p2 = (1948.1 / (Int32.Parse(tb.Text) + 273) - 6.22);
            double p3 = Math.Pow(Math.E, p2 * p1);
            double v = Int32.Parse(v40.Text) * p3;

            return v / v1;
        }

        private double eccup_calculate(double dm, double c0, double p) //調整係數計算
        {
            double cu;
            double ec;
            if (dm <= 100)
            {
                cu = c0 / 22;
                ec = Ec[0, clean.SelectedIndex];
            }
            else
            {
                cu = c0 / 22 * (Math.Pow(100 / dm, 0.5));
                ec = Ec[1, clean.SelectedIndex];
            }
            return ec * cu / p;
        }

        

        private double Life_calculate(double c, double p)//額定壽命計算 輸入額定動負荷C 當量動負荷P 使用全域變數Rpm
        {
            return 1000000 / 60 / Rpm * Math.Pow(c / p, 3);
        }

        private double P_calculate(double x,double y , double fr,double fa) //當量的軸承負荷計算
        {
            return x * fr + y * fa;
        }

        private void X_Y_calculate(int i , double fa , double c0,int b,int a,double fr,out double x , out double y) //XY係數
        {
            double parameter = i * fa / c0; //相對軸向負荷

            if (b == 0) //主軸軸承
            {
                if (a == 0) //15度接觸角計算
                {
                    double XX;
                    double YY;

                    C15(fa,fr,parameter, out XX, out YY);

                    x = XX;
                    y = YY;
                }
                else if (a == 1)//20度接觸角計算
                {
                    int p1 = b; //第一維:配置
                    int p2;
                    if (fa / fr <= 0.57) { p2 = 0; } else { p2 = 1; }//第二維:參數

                    x = A_20[p1, p2, 0];   //第三維第一項:X
                    y = A_20[p1, p2, 1]; //第三維第二項:Y
                }
                else //25度接觸角計算
                {
                    int p1 = b;
                    int p2;
                    if (fa / fr <= 0.68) { p2 = 0; } else { p2 = 1; }

                    x = A_25[p1, p2, 0];
                    y = A_25[p1, p2, 1];
                }
            }
            else //深溝軸承
            {
                double XX;
                double YY;

                DGcal(fa,fr,parameter, out XX, out YY);

                x = XX;
                y = YY;
            }
        }
        
        private double F_calculate(double ka, double fv) //軸向負荷計算
        {
            if (ka > 3 * fv)
            {
                return ka;
            }
            else
            {
                return fv + 0.67 * ka;
            }
        }
        
        private double C_calculate(double ii, double cs) //額定動負荷計算
        {
            return Math.Pow(ii, 0.7) * cs;
        }
        
        private void C15(double fa, double fr,double parameter, out double XX, out double YY) //15度接觸角計算
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
            if (fa / fr <= ee) { p2 = 0; } else { p2 = 1; }//大小
            XX = A_15X[p1, p2];
            YY = A_15Y[p1, p2, kk];
        }

        public void DGcal(double fa,double fr ,double parameter, out double XX, out double YY)  //深溝軸承計算
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
            if (fa / fr <= ee) { p2 = 0; } else { p2 = 1; }//大小
            XX = DGX[p1, p2];
            YY = DGY[p1, p2, kk];
        }

        private double Year_calculate( double hour)  //壽命換算時間
        {
            double p1 = Int32.Parse(Hour_day.Text);
            double p2 = Int32.Parse(Day_year.Text);
            return hour / p1 / p2;
        }
        
       

        #region 延長壽命 目前空的
       

        
        
        #endregion

        //確認是否使用延長壽命
        private void checkornot(bool b,int s)
        {
            lost_chance.IsEnabled = b;
            lost_chance.SelectedIndex = s;
            Tempture.IsEnabled = b;
            Tempture.SelectedIndex = s;
            clean.IsEnabled = b;
            clean.SelectedIndex = s;
            life_p.IsEnabled = b;
            life_p.Text = "1"; //注意這是什麼
            life2.IsEnabled = b;
            life2.Text = "";
            life3.IsEnabled = b;
            life3.Text = "";
            v40.IsEnabled = b;
            v40.Text = "25";
            v100.IsEnabled = b;
            v100.Text = "5";
            tb.IsEnabled = b;
            tb.Text = "60";
            v1.IsEnabled = b;
            v1.Text = "10";
            v3.IsEnabled = b;
            v3.Text = "10";
            k.IsEnabled = b;
            k.Text = "";
            eccup.IsEnabled = b;
            eccup.Text = "";
            life_p.IsEnabled = b;
            life_p.Text = "1";
            k1.IsEnabled = b;
            k1.Text = "";
            eccup1.IsEnabled = b;
            eccup1.Text = "";
            life_p1.IsEnabled = b;
            life_p1.Text = "1";
            aisoC_btm.IsEnabled = b;

        }

        #region 按鈕

        //計算修正係數按鈕
        private void AisoC_btm_Click(object sender, RoutedEventArgs e)
        {
           Aiso_calculate();
           Chart.Source = new BitmapImage(new Uri(@"resource/aiso.png", UriKind.Relative));
        }

        //計算按鈕
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Calculate();
        }

        
        //啟用與停用壽命延長
        private void Uselife2_Checked(object sender, RoutedEventArgs e)
        {
            checkornot(true, 0);
        }

        //如果
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
        #region 圖表顯示按鈕

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
        //顯示軸向公式
        private void Fa_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/P.png", UriKind.Relative));
        }
        //顯示v1圖表
        private void V1_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/v1.png", UriKind.Relative));
        }

        //顯示壽命係數圖表
        private void Aiso_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/aiso.png", UriKind.Relative));
        }
        //係數公式按鈕
        private void P_pic_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/p1p2.png", UriKind.Relative));
        }
        //乾淨度圖表
        private void Clean_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/ec.png", UriKind.Relative));
        }
        //運行黏度表
        private void V_btm_Click(object sender, RoutedEventArgs e)
        {
            Chart.Source = new BitmapImage(new Uri(@"resource/v.png", UriKind.Relative));
        }
        #endregion

        #endregion

        #region 初始化

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

        #region 負荷計算模組

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

        #region 用不到的東西
        //顯示圖片
        private void showimg(string name)
        {
            string route = Directory.GetCurrentDirectory() + "\\resource" + "\\" + name;

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
        #endregion

        
    }
}
