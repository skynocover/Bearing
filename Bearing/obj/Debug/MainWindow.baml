   M S B A M L   `   `   `  ����B  >Bearing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:BearingBearing  5   	       Bearing.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Bearing     5   	   -   5          �Name$
  main��5   	    � Title$ Bearing��5   	   $	��929��6   $
��1519��6&   .��5	      � $��0q�6    � RowDefinitions 5
   
   �� 5      $	��25* �6   �� 5      $��60 �6   �� 5      $
��761* �6   �� 5      $	��52* �6    � ColumnDefinitions 5   
   �� 5      $	��455 �6   �� 5      $	��800 �6   �� 5      .+�5   
   � $
��Left=�6   $��	0,562,0,0q�6*   $	��220��6=   ���	#FF14CDCD$��2��6`   .+�5      �� -   5         ��Name$
 life��5      $��30��6$   $��
100,80,0,0q�60    �� TextWrapping$
 Wrap=�6D   $	��Top=�6X   $
��Left=�6p   $��70��6�    �� 
IsReadOnly . $��14(�6�   �� 5      $��基本額定壽命��6   $��10,82,125,0q�6%   $	��Top=�6:   �� 5      $��前軸承壽命��6   $
��Left=�6$   $��10,0,0,0q�6?   $	��Top=�6Q   $	��156��6i    J� RenderTransformOrigin$ 0.371,-0.12&�6u   $��20(�6�   �� 5      $��當量軸承負荷��6   $��10,40,125,0q�6%   $	��Top=�6:   �� 5      -   5        $ p��5      $
��Left=�6!   $��30��6<   $��
100,40,0,0q�6H   $
 Wrap=�6\   $	��Top=�6p   $��70��6�    . $��14(�6�   �� 5      $��小時��6   $��
170,84,0,0q�6!   $	��Top=�65   $
��Left=�6M   $��39��6h   $ -0.051,0.36&�6s   �� 5      $	��rpm��6   $��171,74,247,0q�6"   $	��Top=�68   �� 5      $��N��6   $��
171,42,0,0q�6    $	��Top=�64   $
��Left=�6L   $��39��6g   $ 	0.103,0.4&�6r   �� 5      -   5        $ 	Life_year��5      $
��Left=�6)   $��30��6D   $��100,160,0,0q�6P   $
 Wrap=�6e   $	��Top=�6y   $��70��6�    . $��14(�6�   �� 5      $��壽命年限��6   $��25,165,130,0q�6#   $	��Top=�69   $ 0.712,-0.12&�6Q   �� 5       $	��年��6   $��170,165,0,0q�6    $	��Top=�65   $
��Left=�6M   $��39��6h   $ -0.051,0.36&�6s   �� 5!      $��延長壽命��6   $��25,121,130,0q�6#   $	��Top=�69   �� 5"      -   5        $ life2��5"      $
��Left=�6%   $��30��6@   $��100,120,0,0q�6L   $
 Wrap=�6a   $	��Top=�6u   $��70��6�    . $��14(�6�   �� 5#      $��小時��6   $��170,125,0,0q�6!   $	��Top=�66   $
��Left=�6N   $��39��6i   $ -0.051,0.36&�6t   5$      � 5%   
   $	��133��6   $��5,5,66,0q�6   $	��Top=�6.   ���	#FFF97E29$��1��6]   $��2��6j   $��2��6z   .+�5&      �� $��每天使用時數��6   $
��Left=�6%   $��	10,65,0,0q�6@   $	��Top=�6S   �� 5'      $��一年使用天數��6   $
��Left=�6%   $��
10,103,0,0q�6@   $	��Top=�6T   $ 
0.463,-0.6&�6l   �� 5(      -   5        $ Day_year��5(      $
��Left=�6(   $��23��6C   $��
97,103,0,0q�6O   $
 Wrap=�6c   $	��Top=�6w   $��44��6�   $	��365��6�   $ 0.494,0.043&�6�   $��16(�6�   �� 5)      $��壽命年限��6   $
��Left=�6#   $��468,429,-310,-298q�6>   $	��Top=�6Y   $ 8.241,12.36&�6q   �� 5*      -   5        $ Hour_day��5*      $��23��6(   $��	97,65,0,0q�64   $
 Wrap=�6G   $	��Top=�6[   $��24��6s   $
��Left=�6}   $��44��6�   $��16(�6�   �� 5+      $��設定加工��6   $	��Top=�6#   $ 0.371,-0.12&�6;   $��20(�6_   $
��Left=�6m   $	��116��6�   �� 5,      $��速度��6   $
��Left=�6!   $��	39,35,0,0q�6<   $	��Top=�6O   �� 5-      -   5        $	 rpm��5-      $
��Left=�6#   $��23��6>   $��	97,35,0,0q�6J   $
 Wrap=�6]   $	��Top=�6q   $��58��6�   $��10000��6�   $��16(�6�   $ 0.239,0.435&�6�   5.      � 5/   
   $��87��6   $��	5,80,66,0q�6   $	��Top=�6.   ���	#FFF75A4A$��2��6]   $��2��6j   .+�50      �� $��設定負荷��6   $
��Left=�6#   $��0,5,0,0q�6>   $	��Top=�6O   $	��116��6g   $ 0.371,-0.12&�6s   $��20(�6�   �� 51      $��外部軸向力��6   $
��Left=�6$   $��	19,50,0,0q�6?   $	��Top=�6R   $��25��6j   �� 52      -	   5        $ ka��52      $
��Left=�6"   $��25��6=   $��	94,50,0,0q�6I   $
 Wrap=�6\   $	��500��6p   $	��Top=�6{   $��51��6�   $��16(�6�   �� 53      -
   5         ��Name$ Fa_btm��53      $��顯示公式��6%   $
��Left=�64   $��
106,10,0,0q�6O   $	��Top=�6c   $��61��6{   $��30��6�   6�   �� 54      $��N��6   $
��Left=�6    $��
150,50,0,0q�6;   $	��Top=�6O   $��25��6g   55      � 56   
   ���	#FFE5E5E5$��	0,0,5,588q�6&   $��2��69   .+�57      �� $��A��6   $
��Left=�6    $��	10,10,0,0q�6;   $	��Top=�6N   $��30��6f   $��41��6r   $��16(�6}   �� 58      -   5        $ A_length��58      $
��Left=�6(   $��30��6C   $��	56,10,0,0q�6O   $
 Wrap=�6b   $	��100��6v   $	��Top=�6�   $��85��6�   $��16(�6�   6�   �� 59      $��B��6   $
��Left=�6    $��	10,50,0,0q�6;   $	��Top=�6N   $��30��6f   $��46��6r   $��16(�6}   $ 0.478,0.333&�6�   �� 5:      -   5        $ B_length��5:      $
��Left=�6(   $��30��6C   $��	56,50,0,0q�6O   $
 Wrap=�6b   $	��100��6v   $	��Top=�6�   $��85��6�   $��16(�6�   6�   �� 5;      $��C��6   $
��Left=�6    $��	10,90,0,0q�6;   $	��Top=�6N   $��30��6f   $��46��6r   $��16(�6}   �� 5<      -   5        $ C_length��5<      $
��Left=�6(   $��30��6C   $��	56,90,0,0q�6O   $
 Wrap=�6b   $	��100��6v   $	��Top=�6�   $��85��6�   $��16(�6�   6�   �� 5=      $��P1��6   $
��Left=�6!   $��
236,10,0,0q�6<   $	��Top=�6P   $��30��6h   $��46��6t   $��16(�6   �� 5>      -   5        $ P1_force��5>      $
��Left=�6(   $��30��6C   $��
287,10,0,0q�6O   $
 Wrap=�6c   $
��-200��6w   $	��Top=�6�   $��85��6�   $��16(�6�   6�   �� 5?      $��P2��6   $
��Left=�6!   $��
236,50,0,0q�6<   $	��Top=�6P   $��30��6h   $��46��6t   $��16(�6   �� 5@      -   5        $ P2_force��5@      $
��Left=�6(   $��30��6C   $��
287,50,0,0q�6O   $
 Wrap=�6c   $
��-100��6w   $	��Top=�6�   $��85��6�   $��16(�6�   6�   �� 5A      $��mm��6   $
��Left=�6!   $��
146,11,0,0q�6<   $	��Top=�6P   $��30��6h   $��67��6t   $��16(�6   �� 5B      $��mm��6   $
��Left=�6!   $��
146,50,0,0q�6<   $	��Top=�6P   $��30��6h   $��67��6t   $��16(�6   �� 5C      $��mm��6   $
��Left=�6!   $��
146,90,0,0q�6<   $	��Top=�6P   $��30��6h   $��53��6t   $��16(�6   �� 5D      $��N��6   $
��Left=�6    $��
377,11,0,0q�6;   $	��Top=�6O   $��30��6g   $��33��6s   $��16(�6~   �� 5E      $��N��6   $
��Left=�6    $��
377,50,0,0q�6;   $	��Top=�6O   $��30��6g   $��39��6s   $��16(�6~   �� 5F      -   5        $ 	force_btm��5F      $��負荷計算��6(   $
��Left=�67   $��
56,127,0,6q�6R   $��85��6f   $��16(�6q   6   �� 5G      $��向上
為正��6   $
��Left=�6-   $��
404,24,0,0q�6H   $	��Top=�6\   $��43��6t   $��63��6   $��16(�6�   $ 0.481,0.222&�6�   �� 5H      -   5        $ 	P_pic_btm��5H      $��負荷
圖示��6(   $
��Left=�6A   $��	7,127,0,6q�6\   $��49��6o   6z   �� 5I      -   5        $ dofarbor��5I      $
��Left=�6(   $��30��6C   $��
287,90,0,0q�6O   $
 Wrap=�6c   $��60��6w   $	��Top=�6�   $��85��6�   $��16(�6�   6�   �� 5J      $��心軸直徑��6   $
��Left=�6#   $��
204,90,0,0q�6>   $	��Top=�6R   $��30��6j   $��78��6v   $��16(�6�   �� 5K      $��楊氏模數��6   $
��Left=�6#   $��204,133,0,0q�6>   $	��Top=�6S   $��30��6k   $��78��6w   $��16(�6�   �� 5L      $��mm��6   $
��Left=�6!   $��
377,90,0,0q�6<   $	��Top=�6P   $��30��6h   $��39��6t   $��16(�6   �� 5M      -   5        $ Eofarbor��5M      $
��Left=�6(   $��30��6C   $��287,133,0,0q�6O   $
 Wrap=�6d   $��21000��6x   $	��Top=�6�   $��85��6�   $��16(�6�   �� 5N      $��kg/mm²��6   $
��Left=�6%   $��372,133,0,0q�6@   $	��Top=�6U   $��30��6m   $��73��6y   $��16(�6�   5O      � 5P   
   $
��Left=�6   $	��390��6*   $��	0,172,0,0q�67   $	��Top=�6J   $	��220��6b   ���	#FFEDF370$��2��6�    5Q      �� 5R      .+�5T      �� $��選擇前軸承��6   $
��Left=�6$   $��	10,45,0,0q�6?   $	��Top=�6R   $	��116��6j   $ 0.371,-0.12&�6v   $��20(�6�   �� 5U      -   5        	 ��Name$	 angle��5U      $
��Left=�6&   $��110,150,0,0q�6A   $	��Top=�6V   $��88��6n   $��26��6y   
 �� SelectedIndex$
 0��6�   .@�5V      �� $
��15°��6   �� 5W      $
��20°��6   �� 5X      $
��25°��6   �� 5Y      $��ComboBoxItem��6   $
��Left=�66   $��98��6Q   5Z      �� 5[      -   5        $	 bearing��5[      $
��Left=�6(   $��110,120,0,0q�6C   $	��Top=�6X   $��88��6p   $ 	0.5,0.095&�6{   $��25��6�   $
 0��6�   .@�5\      �� $��主軸軸承��6   �� 5]      $��深溝軸承��6   5^      �� 5_      $��	接觸角��6   $��30,150,125,0q�6"   $	��Top=�68   $ 
0.464,1.96&�6P   $��14(�6s   �� 5`      $��選用軸承��6   $��25,120,120,0q�6#   $	��Top=�69   $ 	0.5,-0.04&�6Q   $��14(�6s   �� 5a      $��軸承配置��6   $��25,360,120,0q�6#   $	��Top=�69   $��14(�6Q   �� 5b      -   5        $	 b_con��5b      $
��Left=�6&   $��110,360,0,0q�6A   $	��Top=�6V   $��88��6n   $��25��6y   $
 1��6�   $ -0.761,13.48&�6�   .@�5c      �� $��並聯��6   �� 5d      $��DB/DF��6   �� 5e      $	��DBD��6   �� 5f      $	��DBB��6   �� 5g      $��ComboBoxItem��6   $
��Left=�66   $��98��6Q   5h      �� 5i      $��基本額定靜負荷��6   $��0,185,110,0q�6&   $	��Top=�6;   $��14(�6S   $��25��6a   �� 5j      -   5        $ c0��5j      $
��Left=�6"   $��25��6=   $��110,185,0,0q�6I   $
 Wrap=�6^   $��20000��6r   $	��Top=�6   $��63��6�   $ 0.508,-0.522&�6�   $��14(�6�   �� 5k      -   5        $ c_single��5k      $
��Left=�6(   $��25��6C   $��110,220,0,0q�6O   $
 Wrap=�6d   $��19500��6x   $	��Top=�6�   $��63��6�   $��14(�6�   �� 5l      $��基本額定動負荷��6   $��0,220,110,0q�6&   $	��Top=�6;   $��14(�6S   $��25��6a   �� 5m      $��N��6   $
��Left=�6    $��178,185,0,0q�6;   $	��Top=�6P   $��33��6h   $ 0.758,-0.44&�6s   �� 5n      $��N��6   $
��Left=�6    $��179,220,0,0q�6;   $	��Top=�6P   $��33��6h   �� 5o      $��節圓直徑��6   $��25,255,120,0q�6#   $	��Top=�69   $ 	0.418,0.4&�6Q   $��14(�6s   $��25��6�   �� 5p      -   5        $ dm��5p      $
��Left=�6"   $��25��6=   $��110,255,0,0q�6I   $
 Wrap=�6^   $��70��6r   $	��Top=�6|   $��50��6�   $��14(�6�   �� 5q      $��mm��6   $
��Left=�6!   $��160,255,0,0q�6<   $	��Top=�6Q   $��33��6i   �� 5r      $��前軸承徑向負荷��6   $
��Left=�6&   $��	10,10,0,0q�6A   $	��Top=�6T   $ 0.517,0&�6l   $��16(�6�   �� 5s      -   5        $ fr��5s      $
��Left=�6"   $��23��6=   $��
137,14,0,0q�6I   $
 Wrap=�6]   $	��700��6q   $	��Top=�6|   $��69��6�   $ 0.446,-0.478&�6�   $��16(�6�   �� 5t      $��單軸承預壓力��6   $��5,290,120,0q�6%   $	��Top=�6:   $��14(�6R   $��25��6`   �� 5u      -   5        $ fv��5u      $
��Left=�6"   $��25��6=   $��110,290,0,0q�6I   $
 Wrap=�6^   $	��100��6r   $	��Top=�6}   $��50��6�   $ 6.386,-6.435&�6�   $��14(�6�   �� 5v      $��N��6   $��160,290,27,0q�6    $��27��66   $	��Top=�6B   �� 5w      -   5        $ bname��5w      $��30��6%   $��
80,85,15,0q�61   $
 Wrap=�6E   $��7016-L��6Y   $	��Top=�6g   $��20(�6    �� TextAlignment$ Center=�6�   �� 5x      $��型號��6   $��25,83,140,0q�6!   $	��Top=�66   $ 	0.5,-0.04&�6N   $��18(�6p   �� 5y      $��單軸承軸向剛性��6   $��-1,325,111,0q�6&   $	��Top=�6<   $��14(�6T   $��25��6b   �� 5z      -   5        $
 kofb��5z      $
��Left=�6$   $��25��6?   $��110,325,0,0q�6K   $
 Wrap=�6`   $	��100��6t   $	��Top=�6   $��50��6�   $ 6.386,-6.435&�6�   $��14(�6�   �� 5{      $
��N/um��6   $��160,325,0,0q�6#   $ 	0.5,-1.12&�68   $��27��6Z   $	��Top=�6f   �� 5|      -   5        $ loadbearing_btm��5|      $��載入��6.   $
��Left=�6;   $��
121,49,0,0q�6V   $	��Top=�6j   $��47��6�   $��26��6�   6�   �� 5}      -   5        $ savebearing_btm��5}      $��儲存��6.   $��
175,49,5,0q�6;   $	��Top=�6O   $��26��6g   6s   5~      � 5   
   $	��389��6   $��229,173,6,0q�6   $	��Top=�61   ���	#FFEDF370$��2��6`   $	��220��6m    5�      �� 5�      $	��388 �6    .+�5�      �� $��選擇後軸承��6   $
��Left=�6$   $��	10,45,0,0q�6?   $	��Top=�6R   $	��116��6j   $ 0.371,-0.12&�6v   $��20(�6�   �� 5�      -    5        $	 angle1��5�      $
��Left=�6'   $��110,150,0,0q�6B   $	��Top=�6W   $��88��6o   $��26��6z   $
 0��6�   .@�5�      �� $
��15°��6   �� 5�      $
��20°��6   �� 5�      $
��25°��6   5�      �� 5�      -!   5        $	 bearing1��5�      $
��Left=�6)   $��110,120,0,0q�6D   $	��Top=�6Y   $��88��6q   $ 	0.5,0.095&�6|   $��25��6�   $
 0��6�   .@�5�      �� $��主軸軸承��6   �� 5�      $��深溝軸承��6   5�      �� 5�      $��	接觸角��6   $��30,150,125,0q�6"   $	��Top=�68   $ 
0.464,1.96&�6P   $��14(�6s   �� 5�      $��選用軸承��6   $��25,120,120,0q�6#   $	��Top=�69   $ 	0.5,-0.04&�6Q   $��14(�6s   �� 5�      $��軸承配置��6   $��30,360,115,0q�6#   $	��Top=�69   $��14(�6Q   �� 5�      -"   5        $	 b_con1��5�      $
��Left=�6'   $��110,360,0,0q�6B   $	��Top=�6W   $��88��6o   $��25��6z   $
 1��6�   $ -0.761,13.48&�6�   .@�5�      �� $��並聯��6   �� 5�      $��DB/DF��6   �� 5�      $	��DBD��6   �� 5�      $	��DBB��6   5�      �� 5�      $��基本額定靜負荷��6   $��0,185,110,0q�6&   $	��Top=�6;   $��14(�6S   $��25��6a   �� 5�      -#   5        $	 c01��5�      $
��Left=�6#   $��25��6>   $��110,185,0,0q�6J   $
 Wrap=�6_   $��20000��6s   $	��Top=�6�   $��63��6�   $��14(�6�   �� 5�      -$   5        $ 	c_single1��5�      $
��Left=�6)   $��25��6D   $��110,220,0,0q�6P   $
 Wrap=�6e   $��19500��6y   $	��Top=�6�   $��63��6�   $��14(�6�   �� 5�      $��基本額定動負荷��6   $��0,220,110,0q�6&   $	��Top=�6;   $ 0.5,1.88&�6S   $��14(�6t   $��25��6�   �� 5�      $��N��6   $
��Left=�6    $��177,185,0,0q�6;   $	��Top=�6P   $��33��6h   �� 5�      $��N��6   $
��Left=�6    $��177,220,0,0q�6;   $	��Top=�6P   $��33��6h   $ 	0.667,1.6&�6s   �� 5�      $��節圓直徑��6   $��20,255,125,0q�6#   $	��Top=�69   $��14(�6Q   $��25��6_   $ 
0.507,-0.2&�6k   �� 5�      -%   5        $	 dm1��5�      $
��Left=�6#   $��25��6>   $��110,255,0,0q�6J   $
 Wrap=�6_   $��70��6s   $	��Top=�6}   $��50��6�   $��14(�6�   �� 5�      $��mm��6   $
��Left=�6!   $��167,255,0,0q�6<   $	��Top=�6Q   $��33��6i   �� 5�      $��後軸承徑向負荷��6   $
��Left=�6&   $��6,10,0,0q�6A   $	��Top=�6S   $ 0.517,0&�6k   $��16(�6�   �� 5�      -&   5        $	 fr1��5�      $
��Left=�6#   $��23��6>   $��
133,14,0,0q�6J   $
 Wrap=�6^   $	��700��6r   $	��Top=�6}   $��67��6�   $��16(�6�   �� 5�      $��單軸承預壓力��6   $��10,290,115,0q�6%   $	��Top=�6;   $��14(�6S   $��25��6a   �� 5�      -'   5        $	 fv1��5�      $
��Left=�6#   $��25��6>   $��110,290,0,0q�6J   $
 Wrap=�6_   $	��100��6s   $	��Top=�6~   $��50��6�   $ 6.386,-6.435&�6�   $��14(�6�   �� 5�      $��N��6   $��165,290,25,73q�6    $ 	0.667,1.6&�67   �� 5�      -(   5        $ bname1��5�      $��30��6&   $��
80,85,15,0q�62   $
 Wrap=�6F   $��7016-L��6Z   $	��Top=�6h   $��20(�6�   $ Center=�6�   �� 5�      $��型號��6   $��25,85,140,0q�6!   $	��Top=�66   $ 	0.5,-0.04&�6N   $��18(�6p   �� 5�      $��單軸承軸向剛性��6   $��0,326,112,0q�6&   $	��Top=�6;   $��14(�6S   $��29��6a   �� 5�      -)   5        $ kofb1��5�      $
��Left=�6%   $��25��6@   $��110,325,0,0q�6L   $
 Wrap=�6a   $	��100��6u   $	��Top=�6�   $��50��6�   $ 6.386,-6.435&�6�   $��14(�6�   �� 5�      $
��N/um��6   $��165,325,5,38q�6#   $ 	0.667,1.6&�69   �� 5�      -*   5        $ loadbearing1_btm��5�      $��載入��6/   $
��Left=�6<   $��
121,48,0,0q�6W   $	��Top=�6k   $��47��6�   $��26��6�   6�   �� 5�      -+   5        $ savebearing1_btm��5�      $��儲存��6/   $��
175,48,5,0q�6<   $	��Top=�6P   $��26��6h   6t   5�      �� 5�   
   -,   5        $��計算��5�      $��
78,7,305,7q�6   $ 
3.718,-0.5&�6G   $��3��6j   $��16(�6w   � 5�   
   $	��338��6   $	��Top=�6   $��	5,179,5,0q�64   ���	#FF879CE4$��2��6^   $��2��6k    5�      �� 5�      .+�5�      �� $��失效概率��6   $
��Left=�6#   $��
16,271,0,0q�6>   $	��Top=�6R   $��58��6j   $ 0.494,-0.92&�6u   �� 5�      $��最大運行溫度��6   $
��Left=�6%   $��	0,301,0,0q�6@   $	��Top=�6S   $��89��6k   �� 5�      --   5        $	 lost_chance��5�      $
��Left=�6,   $��
89,275,0,0q�6G   $	��Top=�6[   $��56��6s   $
 0��6~   .@�5�      �� $��1%��6   �� 5�      $��2%��6   �� 5�      $��3%��6   �� 5�      $��4%��6   �� 5�      $��5%��6   �� 5�      $	��10%��6   5�      �� 5�      -.   5        $	 Tempture��5�      $
��Left=�6)   $��
89,305,0,0q�6D   $	��Top=�6X   $��60��6p   $
 0��6{   .@�5�      �� $��150°C��6   �� 5�      $��200°C��6   �� 5�      $��250°C��6   �� 5�      $��300°C��6   5�      �� 5�      $��工作溫度��6   $
��Left=�6#   $��
31,147,0,0q�6>   $	��Top=�6R   �� 5�      -/   5        $ tb��5�      $
��Left=�6"   $��23��6=   $��
94,147,0,0q�6I   $
 Wrap=�6]   $	��Top=�6q   $��34��6�   $��60��6�   $��14(�6�   �� 5�      $��40°C黏度��6   $
��Left=�6%   $��	20,78,0,0q�6@   $	��Top=�6S   $��69��6k   �� 5�      -0   5        $	 v40��5�      $
��Left=�6#   $��23��6>   $��	94,78,0,0q�6J   $
 Wrap=�6]   $	��Top=�6q   $��34��6�   $��25��6�   $��14(�6�   �� 5�      $��100°C黏度��6   $
��Left=�6&   $��
20,108,0,0q�6A   $	��Top=�6U   $��82��6m   �� 5�      -1   5        $
 v100��5�      $
��Left=�6$   $��23��6?   $��
94,112,0,0q�6K   $
 Wrap=�6_   $	��Top=�6s   $��30��6�   $��5��6�   $��14(�6�   �� 5�      $��	汙染度��6   $
��Left=�6"   $��	20,44,0,0q�6=   $	��Top=�6P   $��50��6h   $ -2.275,0.72&�6s   �� 5�      -2   5        $	 clean��5�      $
��Left=�6&   $��	75,44,0,0q�6A   $	��Top=�6T   $	��101��6l   $��25��6x   $
 0��6�   .@�5�      �� $��極度清潔��6   �� 5�      $��高清潔度��6   �� 5�      $��正常清潔度��6   �� 5�      $��輕微汙染��6   �� 5�      $��中度汙染��6   �� 5�      $��嚴重汙染��6   �� 5�      $��非常嚴重汙染��6   5�      �� 5�      -3   5         ��Name$ uselife2��5�      $��使用延長使用壽命��6)   $
��Left=�6<   $��	16,10,0,0q�6W   $	��Top=�6j   $��16(�6�   6�   �� 5�      -4   5        $ 	Life2_btm��5�      $��顯示公式��6(   $
��Left=�67   $��	169,5,0,0q�6R   $	��Top=�6e   $��61��6}   $��30��6�   $ 
-0.557,0.4&�6�   �� 5�      -5   5        $ v1_btm��5�      $��顯示參考黏度��6%   $
��Left=�66   $��140,186,0,0q�6Q   $	��Top=�6f   $��90��6~   $��32��6�   6�   �� 5�      -6   5         ��Name$ v2��5�      $��前軸承v1��6    $
��Left=�60   $��
31,179,0,0q�6K   $	��Top=�6_   $��82��6w   �� 5�      -7   5        $ v1��5�      $
��Left=�6"   $��23��6=   $��
92,181,0,0q�6I   $
 Wrap=�6]   $��15��6q   $	��Top=�6{   $��36��6�   $ 0.423,0.565&�6�   $��14(�6�   �� 5�      -8   5        $ 	aisoC_btm��5�      $��計算參考值��6(   $
��Left=�68   $��
73,238,0,0q�6S   $	��Top=�6g   $��83��6   $��28��6�   �� 5�      $��後軸承v1��6   $
��Left=�6$   $��
32,204,0,0q�6?   $	��Top=�6S   $��63��6k   �� 5�      -9   5        $ v3��5�      $
��Left=�6"   $��23��6=   $��
92,206,0,0q�6I   $
 Wrap=�6]   $��15��6q   $	��Top=�6{   $��36��6�   $ 0.423,0.565&�6�   $��14(�6�   �� 5�      -:   5        $ 	clean_btm��5�      $��	參考表��6(   $
��Left=�66   $��
181,44,0,0q�6Q   $	��Top=�6e   $��49��6}   $ 0.293,0.579&�6�   $��25��6�   6�   �� 5�      -;   5        $ v_btm��5�      $��運行黏度表��6$   $
��Left=�64   $��
140,92,0,0q�6O   $	��Top=�6c   $��83��6{   $��32��6�   6�   5�      � 5�   
   $��229,562,6,0q�6   ���	#FF14CDCD$��2��6;   $	��220��6H    5�      �� 5�      $��8* �6    �� 5�      $��18 �6    �� 5�      $
��173* �6    .+�5�      �� -<   5        $ life1��5�      $��30��6%   $��
100,54,0,0q�61   $
 Wrap=�6E   $	��Top=�6Y   $
��Left=�6q   $��70��6�    . $��14(�6�   $��2��6�   �� 5�      $��基本額定壽命��6   $��10,56,125,0q�6%   $	��Top=�6:   $��2��6R   �� 5�      $��後軸承壽命��6   $
��Left=�6$   $��10,0,0,0q�6?   $	��Top=�6Q   $	��156��6i   $ 0.371,-0.12&�6u   $��20(�6�   $��3��6�   �� 5�      $��當量軸承負荷��6   $��10,14,125,0q�6%   $	��Top=�6:   $��2��6R   �� 5�      -=   5        $ p1��5�      $
��Left=�6"   $��30��6=   $��
100,14,0,0q�6I   $
 Wrap=�6]   $	��Top=�6q   $��70��6�    . $��14(�6�   $��2��6�   �� 5�      $��小時��6   $��
170,56,0,0q�6!   $	��Top=�65   $
��Left=�6M   $��39��6h   $ -0.051,0.36&�6s   $��2��6�   �� 5�      $	��rpm��6   $��171,48,49,0q�6"   $	��Top=�67   $��2��6O   �� 5�      $��N��6   $��
171,16,0,0q�6    $	��Top=�64   $
��Left=�6L   $��39��6g   $ 	0.103,0.4&�6r   $��2��6�   �� 5�      ->   5        $ 
Life_year1��5�      $
��Left=�6*   $��30��6E   $��100,134,0,0q�6Q   $
 Wrap=�6f   $	��Top=�6z   $��70��6�    . $��14(�6�   $��2��6�   �� 5�      $��壽命年限��6   $��25,138,130,0q�6#   $	��Top=�69   $��2��6Q   �� 5�      $	��年��6   $��170,138,0,0q�6    $	��Top=�65   $
��Left=�6M   $��39��6h   $ -0.051,0.36&�6s   $��2��6�   �� 5�      $��小時��6   $��
170,97,0,0q�6!   $	��Top=�65   $
��Left=�6M   $��39��6h   $ -0.051,0.36&�6s   $��2��6�   �� 5�      -?   5        $ life3��5�      $
��Left=�6%   $��30��6@   $��
100,94,0,0q�6L   $
 Wrap=�6`   $	��Top=�6t   $��70��6�    . $��14(�6�   $��2��6�   �� 5�      $��延長壽命��6   $��25,97,130,0q�6#   $	��Top=�68   $��2��6P   5�      �� 5�   
   -@   5         ��Name$ Chart��5�      $��0,1,0,0q�6   $��2��60   $��1��6=   � 5�   
   $	��120��6   $��	5,535,5,0q�6   $	��Top=�6/   ���	#FF2C97D4$��2��6^   $��2��6k   .+�5�      �� -A   5        $ k��5�      $
��Left=�6!   $��23��6<   $��	42,40,0,0q�6H   $
 Wrap=�6[   $	��0.1��6o   $	��Top=�6z   $��39��6�    . $��14(�6�   �� 5�      $��k��6   $
��Left=�6    $��	10,40,0,0q�6;   $	��Top=�6N   �� 5�      $��ec*Cu/p��6   $
��Left=�6&   $��
101,40,0,0q�6A   $	��Top=�6U   $ 
0.607,2.52&�6m   �� 5�      -B   5        $ eccup��5�      $
��Left=�6%   $��23��6@   $��
175,42,0,0q�6L   $
 Wrap=�6`   $	��0.1��6t   $	��Top=�6   $��39��6�    . $ 1,3.826&�6�   $��14(�6�   �� 5�      $��壽命調整係數��6   $
��Left=�6%   $��7,76,0,0q�6@   $	��Top=�6R   $ 
0.537,-1.8&�6j   �� 5�      -C   5        $ life_p��5�      $
��Left=�6&   $��23��6A   $��
109,76,0,0q�6M   $
 Wrap=�6a   $	��Top=�6u   $��48��6�   $��1��6�   $ 0.562,0.217&�6�   $��14(�6�   �� 5�      -D   5        $ aiso_btm��5�      $��圖表��6'   $
��Left=�64   $��
175,78,0,0q�6O   $	��Top=�6c   $��46��6{   $��23��6�   $ 0.696,-0.043&�6�   �� 5�      $��前軸承調整係數��6   $
��Left=�6&   $��7,0,0,0q�6A   $	��Top=�6R   $��20(�6j   5�      � 5�   
   $��	5,674,5,0q�6   ���	#FF2C97D4$��2��69   $��2��6F   $	��120��6V   $	��Top=�6c   $��2��6{   .+�5�      �� -E   5        $ k1��5�      $
��Left=�6"   $��23��6=   $��	42,40,0,0q�6I   $
 Wrap=�6\   $	��0.1��6p   $	��Top=�6{   $��39��6�    . $��14(�6�   �� 5�      $��k��6   $
��Left=�6    $��	10,40,0,0q�6;   $	��Top=�6N   �� 5�      $��ec*Cu/p��6   $
��Left=�6&   $��
101,40,0,0q�6A   $	��Top=�6U   $ 
0.607,2.52&�6m   �� 5      -F   5        $ eccup1��5      $
��Left=�6&   $��23��6A   $��
175,42,0,0q�6M   $
 Wrap=�6a   $	��0.1��6u   $	��Top=�6�   $��39��6�    . $ 1,3.826&�6�   $��14(�6�   �� 5     $��壽命調整係數��6   $
��Left=�6%   $��7,76,0,0q�6@   $	��Top=�6R   $ 
0.537,-1.8&�6j   �� 5     -G   5        $ life_p1��5     $
��Left=�6'   $��23��6B   $��
109,76,0,0q�6N   $
 Wrap=�6b   $	��Top=�6v   $��48��6�   $��1��6�   $ 0.562,0.217&�6�   $��14(�6�   �� 5     -H   5        $ 	aiso_btm1��5     $��圖表��6(   $
��Left=�65   $��
175,78,0,0q�6P   $	��Top=�6d   $��46��6|   $��23��6�   $ 0.696,-0.043&�6�   �� 5     $��後軸承調整係數��6   $
��Left=�6&   $��7,0,0,0q�6A   $	��Top=�6R   $��20(�6j   5     �� 5  
   -I   5        $ 	Life1_btm��5     $��顯示公式��6$   $
��Left=�63   $��10,7,0,7q�6N   $��63��6`   $��3��6�   o� 5  
   $��0q�6   $��3��6   .@�5     �� -J   5        $ 	saveroute��5     $��16(�6(   $��選擇儲存路徑��66   6G   �� 5
     -K   5        $ loadspindle_btm��5
     $��載入主軸��6.   $��16(�6=   6K   5     � 5  
   $��0,0,6,0q�6   $��1��6    ���	#FFB8A6A6.+�5     �� -L   5        $ spindlename��5     $
��Left=�6+   $��33��6F   $��	76,17,0,0q�6R   $
 Wrap=�6e   $	��Top=�6y   $	��105��6�   $��24(�6�   $
��TEST��6�   $ Center=�6�   �� 5     $��	主軸：��6   $
��Left=�6"   $��	10,17,0,0q�6=   $	��Top=�6P   $��61��6h   $��18(�6s   �� 5     -M   5        $ savespindle_btm��5     $��儲存主軸��6.   $
��Left=�6=   $��
208,17,0,0q�6X   $	��Top=�6l   $��86��6�   $��35��6�   $��18(�6�   6�   �� 5     -N   5        $ saveplan_btm��5     $��儲存方案��6+   $
��Left=�6:   $��
308,17,0,0q�6U   $	��Top=�6i   $��92��6�   $��35��6�   $��18(�6�   6�   5     �� 5  
   -O   5        $ 	plan1_btm��5     $��	方案一��6$   $��1��62   $
��Left=�6B   $��1��6]   $	��Top=�6j   $	��160��6�   $��40��6�   $��20(�6�   {�.  6�   �� 5  
   -P   5        $ del1_btm��5     $��刪除��6#   $��1��60   $
��Left=�6@   $��0,40,0,0q�6[   $��1��6m   $	��Top=�6z   $	��160��6�   $��20��6�   $��14(�6�   {�.  6�   �� 5  
   -Q   5        $ 	plan2_btm��5     $��	方案二��6$   $��1��62   $
��Left=�6B   $��	160,0,0,0q�6]   $��1��6p   $	��Top=�6}   $	��160��6�   $��40��6�   $��20(�6�   {�.  6�   �� 5  
   -R   5        $ 	plan3_btm��5     $��	方案三��6$   $��1��62   $
��Left=�6B   $��	320,0,0,0q�6]   $��1��6p   $	��Top=�6}   $	��160��6�   $��40��6�   $��20(�6�   {�.  6�   �� 5  
   -S   5        $ 	plan4_btm��5     $��	方案四��6$   $��1��62   $
��Left=�6B   $��	480,0,0,0q�6]   $��1��6p   $	��Top=�6}   $	��160��6�   $��40��6�   $��20(�6�   {�.  6�   �� 5  
   -T   5        $ 	plan5_btm��5     $��	方案五��6$   $��1��62   $
��Left=�6B   $��	640,0,0,0q�6]   $��1��6p   $	��Top=�6}   $	��160��6�   $��40��6�   $��20(�6�   {�.  6�   �� 5  
   -U   5        $ del2_btm��5     $��刪除��6#   $��1��60   $
��Left=�6@   $��
160,40,0,0q�6[   $��1��6o   $	��Top=�6|   $	��160��6�   $��14(�6�   {�.  6�   �� 5  
   -V   5        $ del3_btm��5     $��刪除��6#   $��1��60   $
��Left=�6@   $��
320,40,0,0q�6[   $��1��6o   $	��Top=�6|   $	��160��6�   $��20��6�   $��14(�6�   {�.  6�   �� 5  
   -W   5        $ del4_btm��5     $��刪除��6#   $��1��60   $
��Left=�6@   $��
480,40,0,0q�6[   $��1��6o   $	��Top=�6|   $	��160��6�   $��20��6�   $��14(�6�   {�.  6�   �� 5  
   -X   5        $ del5_btm��5     $��刪除��6#   $��1��60   $
��Left=�6@   $��
640,40,0,0q�6[   $��1��6o   $	��Top=�6|   $	��160��6�   $��20��6�   $��14(�6�   {�.  6�   �� 5  
   -Y   5        $ 	totallife��5     $��	總壽命��6#   $
��Left=�61   $��
159,10,0,0q�6L   $��3��6`   $	��Top=�6m   $	��112��6�   $��16(�6�   �� 5  
   -Z   5        $ TotalR��5     $��	總剛性��6    $��
276,10,5,0q�6.   $��3��6B   $	��Top=�6O   $��16(�6g   �� 5  
   -[   5        $ x_box1��5     $��1��6"   $
��Left=�62   $��23��6M   $��	73,10,0,0q�6Y   $��3��6l   $
 Wrap=�6y   $	��Top=�6�   $��45��6�   �� 5  
   $��
前軸承X��6   $��1��6   $
��Left=�6/   $��	10,10,0,0q�6J   $��3��6]   $	��Top=�6j   $��74��6�   $��30��6�   �� 5   
   -\   5        $ y_box1��5      $��1��6"   $
��Left=�62   $��23��6M   $��
198,12,0,0q�6Y   $��3��6m   $
 Wrap=�6z   $	��Top=�6�   $��45��6�   �� 5!  
   $��
前軸承Y��6   $��1��6   $
��Left=�6/   $��
135,12,0,0q�6J   $��3��6^   $	��Top=�6k   $��74��6�   $��30��6�   �� 5"  
   -]   5        $ x_box2��5"     $��1��6"   $
��Left=�62   $��23��6M   $��
335,14,0,0q�6Y   $��3��6m   $
 Wrap=�6z   $	��Top=�6�   $��45��6�   �� 5#  
   $��
後軸承X��6   $��1��6   $
��Left=�6/   $��
272,14,0,0q�6J   $��3��6^   $	��Top=�6k   $��74��6�   $��30��6�   �� 5$  
   -^   5        $ y_box2��5$     $��1��6"   $
��Left=�62   $��23��6M   $��
469,15,0,0q�6Y   $��3��6m   $
 Wrap=�6z   $	��Top=�6�   $��45��6�   �� 5%  
   $��
後軸承X��6   $��1��6   $
��Left=�6/   $��
406,15,0,0q�6J   $��3��6^   $	��Top=�6k   $��74��6�   $��30��6�   5'     5(     