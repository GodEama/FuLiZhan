//
//  Const.swift
//  News_swift
//
//  Created by 123 on 2018/10/16.
//  Copyright © 2018年 jingying. All rights reserved.
//

import UIKit
//屏幕宽度
let screenWidth = UIScreen.main.bounds.width
//屏幕高度
let screenHeight = UIScreen.main.bounds.height

///服务器地址
let BASE_URL = "http://www.fjjkg.com/mapi/"
///device_id
let device_id = "6096495334"
///iid
let IID = "5034850950"


/// 头部视图高度
let kMyHeaderViewHeight:CGFloat = 280.0


let isNight = "isNight"
 //判断是否是ipad
let isPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
//判断iPhoneX序列（iPhoneX，iPhoneXs，iPhoneXs Max）
let IS_IPHONE_X:Bool = Int((screenHeight/screenWidth)*100) == 216
let kTopHeight : CGFloat = IS_IPHONE_X ? 88 : 64



/*
 //判断是否是ipad
 #define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
 //判断iPhone4系列
 #define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
 //判断iPhone5系列
 #define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
 //判断iPhone6 6s 7系列
 #define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
 //判断iphone6p 6sp 7p系列
 #define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
 //判断iPhoneX序列（iPhoneX，iPhoneXs，iPhoneXs Max）
 #define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
 //判断iPHoneXr
 #define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
 //iPhoneX系列
 #define k_Height_NavContentBar 44.0f
 #define k_Height_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
 #define k_Height_NavBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
 #define k_Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)

 */



