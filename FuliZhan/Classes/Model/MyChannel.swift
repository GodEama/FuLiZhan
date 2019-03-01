//
//  MyChannel.swift
//  FuliZhan
//
//  Created by 123 on 2018/11/1.
//  Copyright © 2018 jingying. All rights reserved.
//

import Foundation
import HandyJSON

struct Banner    : HandyJSON {
    var img: String = ""
    var title: String = ""
    var url: String = ""
}

struct Video    : HandyJSON {
    var address: String = ""
    var img: String = ""
    var title: String = ""
//    var flag: NSInteger = 0
}

struct MyChannel    : HandyJSON {
    var address: String = ""
    var xinimg: String = ""
    var Number: String = ""
    var title: String = ""
}


