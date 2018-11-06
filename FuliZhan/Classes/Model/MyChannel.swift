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
    var address: String!
    var id: String = ""
    var img: String = ""
    var title: String = ""
    var type: String = ""
    var number: String = ""
}

struct MyChannel    : HandyJSON {
    var banner: [Banner]!
    var loop: String = ""
    var url: String = ""
    var video: [Video]!
}


