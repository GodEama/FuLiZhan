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

//判断是否是ipad
let isPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
//判断iPhoneX序列（iPhoneX，iPhoneXs，iPhoneXs Max）
let IS_IPHONE_X:Bool = Int((screenHeight/screenWidth)*100) == 216
let kTopHeight : CGFloat = IS_IPHONE_X ? 88 : 64



