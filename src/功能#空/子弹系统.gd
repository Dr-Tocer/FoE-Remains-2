extends Node2D
#子弹编号=[0基础伤害,1穿透力,2护甲破坏力,3精准度影响,4后坐力影响,5小出血概率,6大出血概率,7子弹初速] sd实弹
var sd_001 = [66, 7, 27, 10, -10, 15, 10, 385] # 7.62x25mm TT LRNPC  
var sd_002 = [64, 8, 28, 5, -5, 15, 10, 375] # 7.62x25mm TT LRN  
var sd_003 = [60, 11, 29, 0, 0, 0, 0, 427] # 7.62x25mm TT FMJ43  
var sd_004 = [58, 12, 32, 15, -15, 0, 0, 425] # 7.62x25mm TT AKBS  
var sd_005 = [58, 14, 32, 0, 0, 0, 0, 430] # 7.62x25mm TT P gl  
var sd_006 = [55, 18, 34, -10, 0, 0, 0, 415] # 7.62x25mm TT PT gzh T  
var sd_007 = [50, 25, 36, 0, 0, 0, 0, 430] # 7.62x25mm TT Pst gzh  
var sd_008 = [67, 1, 2, 0, 0, 15, 10, 250] # 9x18mm PM SP8 gzh  
var sd_009 = [77, 2, 5, 0, 0, 25, 10, 420] # 9x18mm PM SP7 gzh  
var sd_010 = [69, 3, 5, 0, 0, 10, 0, 280] # 9x18mm PM PSV  
var sd_011 = [50, 5, 16, 0, 0, 10, 0, 302] # 9x18mm PM P gzh  
var sd_012 = [54, 5, 13, 10, 0, 10, 0, 315] # 9x18mm PM PSO gzh  
var sd_013 = [55, 6, 16, 0, 0, 15, 0, 330] # 9x18mm PM PS gs PPO  
var sd_014 = [58, 6, 16, 0, 0, 15, 0, 302] # 9x18mm PM PRS gs  
var sd_015 = [61, 7, 15, 0, 0, 15, 0, 297] # 9x18mm PM PPg gzh  
var sd_016 = [59, 8, 22, -5, -7, 15, 0, 301] # 9x18mm PM PPT gzh T  
var sd_017 = [50, 12, 26, 0, 0, 0, 0, 298] # 9x18mm PM Pst gzh  
var sd_018 = [65, 13, 26, 0, 0, 0, 0, 330] # 9x18mm PM RG028 gzh  
var sd_019 = [53, 18, 28, 0, 0, 15, 10, 325] # 9x18mm PM BZhT gzh  
var sd_020 = [58, 24, 33, 0, 5, 0, 0, 420] # 9x18mm PMM PstM gzh  
var sd_021 = [40, 28, 30, 0, 4, 0, 0, 519] # 9x18mm PM PBM gzh  
var sd_022 = [102, 2, 11, 0, 5, 30, 10, 381] # 9x19mm RIP  
var sd_023 = [85, 8, 22, 10, 10, 15, 22, 290] # 9x19mm QuakeMaker  
var sd_024 = [59, 10, 32, 0, 0, 0, 0, 340] # 9x19mm PSO gzh  
var sd_025 = [70, 10, 38, 0, 0, 20, 20, 420] # 9x19mm Luger CCI  
var sd_026 = [58, 14, 33, -5, -6, 0, 0, 365] # 9x19mm Green Tracer T  
var sd_027 = [56, 18, 35, 0, 0, 0, 0, 385] # 9x19mm FMJ M882  
var sd_028 = [54, 20, 33, 0, 0, 0, 0, 457] # 9x19mm Pst gzh  
var sd_029 = [52, 30, 48, 0, 0, 0, 0, 392] # 9x19mm AP 6.3  
var sd_030 = [44, 39, 53, 5, 5, 0, 0, 560] # 9x19mm PBP gzh (7N31)
var sd_031 = [80, 15, 63, 3, -5, 15, 10, 415] # 9x21mm PE gzh(SP12)
var sd_032 = [65, 18, 44, 0, 0, 15, 10, 413] # 9x21mm P gzh(SP11)
var sd_033 = [59, 22, 39, 1, -3, 0, 0, 410] # 9x21mm PS gzh(SP10)
var sd_034 = [53, 27, 44, 0, 0, 0, 0, 300] # 9x21mm 7U4
var sd_035 = [52, 32, 42, -5, 5, 0, 0, 410] # 9x21mm BT gzh (SP13)T
var sd_036 = [49, 38, 47, -3, 10, 0, 0, 400] # 9x21mm 7N42 "Zubilo"
var sd_037 = [108, 12, 15, 27, -29, 35, 20, 455] # .357 Magnum SP
var sd_038 = [99, 18, 20, 15, 15, 40, 30, 481] # .357 Magnum HP
var sd_039 = [88, 24, 28, 15, 8, 25, 25, 425] # .357 Magnum JHP
var sd_040 = [70, 35, 43, 0, 12, 0, 10, 385] # .357 Magnum FMJ
var sd_041 = [130, 3, 12, -5, 0, 30, 20, 293] # .45 ACP RIP
var sd_042 = [100, 13, 30, 0, 0, 0, 30, 274] # .45 ACP Hydra-Shok
var sd_043 = [76, 19, 37, 10, 0, 0, 0, 290] # .45 ACP Lasermatch FMJ T
var sd_044 = [72, 25, 36, 0, 0, 0, 0, 340] # .45 ACP Match FMJ
var sd_045 = [66, 38, 48, -5, 7, 0, 0, 299] # .45 ACP AP
var sd_046 = [130, 3, 23, -10, 5, 35, 40, 440] # .50 AE JHP
var sd_047 = [122, 26, 28, -5, 2, 25, 30, 465] # .50 AE Hawk JSP
var sd_048 = [94, 33, 56, 5, 8, 0, 10, 460] # .50 AE Copper Solid
var sd_049 = [85, 40, 50, 0, 10, 0, 10, 440] # .50 AE FMJ
var sd_050 = [65, 18, 28, 0, 0, 0, 0, 690] # 4.6x30mm Action SX
var sd_051 = [52, 23, 33, 10, -22, 0, 0, 290] # 4.6x30mm Subsonic SX
var sd_052 = [46, 32, 37, 0, 0, 0, 0, 579] # 4.6x30mm JSP SX
var sd_053 = [43, 40, 41, 0, 0, 0, 0, 620] # 4.6x30mm FMJ SX
var sd_054 = [35, 53, 46, 0, 10, 0, 0, 680] # 4.6x30mm AP SX FM
var sd_055 = [98, 8, 7, 0, 0, 20, 20, 729] # 5.7x28mm R37.F
var sd_056 = [81, 11, 9, -5, 0, 10, 10, 724] # 5.7x28mm R37.X
var sd_057 = [70, 17, 19, 0, 0, 0, 0, 792] # 5.7x28mm SS198LF
var sd_058 = [62, 25, 22, 10, 0, 0, 0, 594] # 5.7x28mm SS197SR
var sd_059 = [59, 27, 37, 5, -15, 0, 0, 299] # 5.7x28mm SB193 FM
var sd_060 = [53, 33, 41, -4, 0, 0, 0, 715] # 5.7x28mm L191 T
var sd_061 = [49, 37, 43, 0, 0, 0, 0, 715] # 5.7x28mm SS190
var sd_062 = [76, 9, 15, 3, -3, 15, 15, 884] # 5.45x39mm HP
var sd_063 = [70, 13, 24, 0, -5, 0, 0, 866] # 5.45x39mm PRS gs
var sd_064 = [67, 15, 31, 5, -5, 10, 10, 873] # 5.45x39mm SP
var sd_065 = [65, 17, 33, 0, -15, 0, 0, 303] # 5.45x39mm US gs
var sd_066 = [59, 20, 36, -3, 0, 0, 0, 883] # 5.45x39mm T gs T
var sd_067 = [55, 24, 38, 0, 0, 0, 0, 884] # 5.45x39mm FMJ
var sd_068 = [56, 28, 40, 0, 0, 0, 0, 890] # 5.45x39mm PS gs
var sd_069 = [51, 34, 42, -2, 3, 0, 0, 886] # 5.45x39mm PP gs
var sd_070 = [54, 37, 44, -4, 5, 0, 0, 880] # 5.45x39mm BT gs T
var sd_071 = [55, 42, 45, 50, -10, 20, 15, 915] # 5.45x39mm 7N40 FM
var sd_072 = [48, 45, 46, -3, 7, 0, 0, 890] # 5.45x39mm BP gs FM
var sd_073 = [45, 54, 57, -4, 10, 0, 0, 830] # 5.45x39mm BS gs FM
var sd_074 = [37, 62, 59, -5, 15, 0, 0, 905] # 5.45x39mm PPBS gs "Igolnik" (7N39)FM
var sd_075 = [88, 3, 11, 10, 10, 20, 20, 936] # 5.56x45mm Warmageddon
var sd_076 = [79, 7, 22, 0, 0, 15, 15, 947] # 5.56x45mm HP
var sd_077 = [72, 11, 24, 0, 0, 0, 0, 936] # 5.56x45mm MK 255 Mod 0 (RRLP)
var sd_078 = [60, 18, 26, -2, -2, 0, 0, 874] # 5.56x45mm M856 T
var sd_079 = [57, 23, 33, 0, 0, 0, 0, 957] # 5.56x45mm FMJ
var sd_080 = [54, 31, 37, 0, 0, 0, 0, 922] # 5.56x45mm M855
var sd_081 = [53, 33, 39, 2, 3, 15, 10, 902] # 5.56x45mm MK 318 Mod 0 (SOST)
var sd_082 = [52, 38, 44, -4, 4, 0, 0, 940] # 5.56x45mm M856A1 T
var sd_083 = [49, 44, 47, -5, 5, 0, 0, 945] # 5.56x45mm M855A1 FM
var sd_084 = [42, 53, 52, -7, 8, 0, 0, 1013] # 5.56x45mm M995 FM
var sd_085 = [38, 57, 58, -9, 6, 0, 0, 1013] # 5.56x45mm SSA AP FM
var sd_086 = [80, 36, 49, 0, 0, 0, 0, 899] # 6.8x51mm SIG FMJ
var sd_087 = [72, 47, 58, 3, 10, 0, 0, 914] # 6.8x51mm SIG Hybrid FM
var sd_088 = [90, 14, 19, 5, -5, 0, 20, 853] # .300 Whisper
var sd_089 = [72, 20, 25, 30, -10, 22, 0, 723] # .300 Blackout V-Max
var sd_090 = [60, 30, 36, 0, 0, 0, 0, 605] # .300 Blackout BCP FMJ
var sd_091 = [54, 36, 40, 0, 1, 0, 0, 442] # .300 Blackout M62 Tracer T
var sd_092 = [58, 43, 57, 0, 5, 0, 0, 725] # .300 Blackout CBJ FM
var sd_093 = [51, 48, 65, 0, 3, 15, 15, 635] # .300 Blackout AP FM
var sd_094 = [80, 15, 20, -5, 5, 15, 15, 754] # 7.62x39mm HP
var sd_095 = [68, 20, 27, 5, -5, 5, 5, 772] # 7.62x39mm SP
var sd_096 = [63, 26, 33, 2, -2, 0, 0, 775] # 7.62x39mm FMJ
var sd_097 = [56, 29, 42, 5, -30, 0, 0, 301] # 7.62x39mm US gzh
var sd_098 = [65, 30, 46, -4, -6, 0, 0, 720] # 7.62x39mm T-45M1 gzh T
var sd_099 = [61, 35, 52, 0, 0, 0, 0, 717] # 7.62x39mm PS gzh
var sd_100 = [59, 41, 57, -1, 5, 0, 0, 732] # 7.62x39mm PP gzh
var sd_101 = [58, 47, 63, -3, 7, 0, 0, 730] # 7.62x39mm BP gzh FM
var sd_102 = [53, 58, 76, -5, 10, 10, 10, 875] # 7.62x39mm MAI AP FM
var sd_103 = [105, 15, 40, 5, -5, 20, 20, 823] # 7.62x51mm Ultra Nosler
var sd_104 = [85, 30, 25, -1, -3, 15, 15, 771] # 7.62x51mm TPZ SP
var sd_105 = [83, 37, 56, 0, 0, 12, 12, 800] # 7.62x51mm BPZ FMJ
var sd_106 = [82, 42, 65, -5, 1, 10, 10, 838] # 7.62x51mm M62 Tracer T FM
var sd_107 = [80, 43, 67, -3, 1, 8, 8, 838] # 7.62x51mm M80 FM
var sd_108 = [75, 55, 74, -2, 3, 7, 7, 838] # 7.62x51mm M61 FM
var sd_109 = [73, 60, 79, -1, 4, 6, 6, 899] # 7.62x51mm M80A1 FM
var sd_110 = [70, 65, 85, -4, 6, 5, 5, 930] # 7.62x51mm M993 FM
var sd_111 = [102, 23, 37, 10, 0, 0, 0, 807] # 7.62x54mm R HP BT
var sd_112 = [92, 27, 56, 7, 0, 0, 0, 706] # 7.62x54mm R SP BT
var sd_113 = [84, 33, 63, 0, 0, 0, 0, 760] # 7.62x54mm R FMJ
var sd_114 = [82, 41, 83, -1, -5, 0, 0, 800] # 7.62x54mm R T-46M gzh T
var sd_115 = [81, 42, 78, -5, 0, 0, 0, 865] # 7.62x54mm R LPS gzh
var sd_116 = [84, 45, 84, 10, 8, 0, 0, 875] # 7.62x54mm R PS gzh(7N1) FM
var sd_117 = [78, 55, 87, -2, -4, 0, 0, 875] # 7.62x54mm R BT gzh (7BT1)T FM
var sd_118 = [75, 62, 87, 0, 10, 0, 0, 875] # 7.62x54mm R SNB gzh FM
var sd_119 = [72, 70, 88, 0, 0, 0, 0, 785] # 7.62x54mm R BS gs (7N37)FM
var sd_120 = [196, 18, 55, 10, 5, 80, 50, 880] # .338 Lapua Magnum TAC-X
var sd_121 = [142, 32, 70, -5, 0, 50, 40, 849] # .338 Lapua Magnum UCW
var sd_122 = [122, 47, 83, 0, 0, 35, 50, 900] # .338 Lapua Magnum FMJ FM
var sd_123 = [115, 79, 89, 0, 10, 20, 55, 849] # .338 Lapua Magnum AP FM
var sd_124 = [75, 17, 28, 5, -5, 0, 0, 330] # 9x39mm FMJ
var sd_125 = [71, 28, 39, 0, 0, 0, 10, 290] # 9x39mm SP-5 gs
var sd_126 = [68, 35, 48, 10, 7, 10, 20, 310] # 9x39mm SPP gs
var sd_127 = [62, 43, 57, -15, 10, 10, 12, 320] # 9x39mm PAB-9 gs FM
var sd_128 = [60, 48, 64, 0, 5, 10, 10, 305] # 9x39mm SP-6 gs FM
var sd_129 = [58, 54, 69, 10, 15, 0, 0, 295] # 9x39mm BP gs FM
var sd_130 = [110, 14, 38, 0, 0, 30, 10, 550] # 366 TKM Geksa
var sd_131 = [98, 23, 48, 0, 10, 20, 25, 580] # 366 TKM FMJ
var sd_132 = [73, 30, 40, -10, -15, 0, 20, 770] # 366 TKM EKO
var sd_133 = [90, 42, 60, -22, 35, 0, 10, 602] # 366 TKM AP-M FM
var sd_134 = [165, 10, 22, -15, -12, 35, 30, 290] # 12.7x55mm PS12A
var sd_135 = [115, 28, 60, 10, 0, 30, 20, 285] # 12.7x55mm PS12
var sd_136 = [102, 46, 57, 0, 15, 0, 15, 570] # 12.7x55mm PS12B FM
var sd_137 = [0, 1, 15, 0, 0, 0, 0, 330] # 12/70 5.25mm buckshot
var sd_138 = [0, 2, 26, -15, 115, 20, 10, 385] # 12/70 8.5mm Magnum buckshot
var sd_139 = [0, 3, 26, 15, 0, 0, 0, 430] # 12/70 6.5mm Express buckshot
var sd_140 = [0, 3, 26, 0, 0, 0, 0, 415] # 12/70 7mm buckshot
var sd_141 = [0, 24, 22, -5, 0, 15, 15, 310] # 12/70 Piranha(食人鱼)
var sd_142 = [0, 31, 26, -10, 0, 25, 25, 320] # 12/70 flechette(箭形弹)
var sd_143 = [265, 2, 11, 80, 35, 40, 25, 410] # 12/70 RIP
var sd_144 = [220, 5, 12, 170, -15, 30, 40, 594] # 12/70 SuperFormance HP slug
var sd_145 = [190, 12, 48, 80, 20, 0, 10, 390] # 12/70 Grizzly 40 slug
var sd_146 = [206, 14, 46, 150, 10, 35, 25, 442] # 12/70 Copper Sabot Premier HP slug FM
var sd_147 = [167, 15, 55, 120, 0, 10, 15, 370] # 12/70 lead slug
var sd_148 = [140, 17, 40, 110, -15, 0, 0, 410] # 12/70 "Poleva-3" slug
var sd_149 = [0, 17, 65, 100, 15, 0, 15, 415] # 12/70 Dual Sabot slug
var sd_150 = [183, 20, 50, 135, -25, 0, 0, 480] # 12/70 FTX Custom Lite slug
var sd_151 = [150, 20, 50, 115, -10, 0, 5, 430] # 12/70 "Poleva-6u" slug
var sd_152 = [197, 26, 57, 90, 25, 0, 15, 410] # 12/70 makeshift .50 BMG slug T
var sd_153 = [164, 37, 65, 80, 50, 0, 10, 510] # 12/70 AP-20 armor-piercing slug FM
var sd_154 = [0, 1, 12, -10, 10, 0, 0, 340] # 20/70 5.6mm buckshot
var sd_155 = [0, 2, 13, 0, 0, 0, 0, 410] # 20/70 6.2mm buckshot
var sd_156 = [0, 3, 14, 0, 0, 0, 0, 430] # 20/70 7.5mm buckshot
var sd_157 = [0, 3, 13, 0, 15, 0, 0, 475] # 20/70 7.3mm buckshot
var sd_158 = [198, 5, 13, 125, 30, 20, 30, 405] # 20/70 Devastator slug
var sd_159 = [120, 14, 35, 110, -15, 0, 0, 425] # 20/70 "Poleva-3" slug
var sd_160 = [154, 16, 42, 130, 5, 0, 30, 415] # 20/70 Star slug
var sd_161 = [135, 17, 40, 110, -10, 0, 10, 445] # 20/70 "Poleva-6u" slug
var sd_162 = [0, 24, 24, 0, 0, 0, 0, 400] # 20/70 flechette
var sd_163 = [143, 25, 47, 60, 40, 20, 30, 476] # 20/70 Dangerous Game Slug
var sd_164 = [155, 30, 54, 64, 48, 20, 30, 482] # 20/70 TSS Armor Piercing Slug
var sd_165 = [0, 0, 0, 0, 0, 0, 0, 80] # 23x75mm Zvezda flashbang round (闪光)FM
var sd_166 = [0, 10, 20, 20, 10, 0, 0, 375] # 23x75mm Shrapnel-25 buckshot
var sd_167 = [0, 11, 20, 0, 0, 0, 0, 270] # 23x75mm Shrapnel-10 buckshot
var sd_168 = [192, 39, 75, -5, 25, 0, 0, 420] # 23x75mm Barrikada slug
var sd_169 = [0, 5, 95, 0, 0, 0, 0, 269] # 40x46mm M576 (MP-APERS) grenade
var sd_170 = [199, 1, 95, 0, 0, 0, 0, 185] # 30x29mm VOG-30
var sd_171 = [199, 80, 95, 0, 0, 0, 0, 818] # 12.7x108mm BZT-44M
var sd_172 = [182, 88, 88, 0, 0, 0, 0, 818] # 12.7x108mm B-32 T
