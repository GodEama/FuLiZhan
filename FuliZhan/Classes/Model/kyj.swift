//
//  kyj.swift
//  FuliZhan
//
//  Created by 123 on 2019/1/26.
//  Copyright © 2019 jingying. All rights reserved.
//

import Foundation
import HandyJSON

struct Userinfo    : HandyJSON {
    var id: String = ""
    var user_nicename: String = ""
    var avatar: String = ""
    var coin: String = ""
    var avatar_thumb: String = ""
    var sex: String = ""
    var signature: String = ""
    var province: String = ""
    var city: String = ""
    var birthday: String = ""
    var age: String = ""
    var code: String = ""
    var vip_endtime: String = ""
    var praise: String = ""
    var fans: String = ""
    var follows: String = ""
    var workVideos: String = ""
    var likeVideos: String = ""
}

struct Musicinfo    : HandyJSON {
    var id: String = ""
    var title: String = ""
    var author: String = ""
    var img_url: String = ""
    var length: String = ""
    var file_url: String = ""
    var use_nums: String = ""
    var music_format: String = ""
}

struct InfoItem    : HandyJSON {
    var id: String = ""
    var uid: String = ""
    var title: String = ""
    var thumb: String = ""
    var thumb_s: String = ""
    var href: String = ""
    var likes: String = ""
    var views: String = ""
    var comments: String = ""
    var steps: String = ""
    var shares: String = ""
    var addtime: String = ""
    var lat: String = ""
    var lng: String = ""
    var city: String = ""
    var isdel: String = ""
    var music_id: String = ""
    var xiajia_reason: String = ""
    var show_val: String = ""
    var nopass_time: String = ""
    var watch_ok: String = ""
    var is_ad: String = ""
    var ad_endtime: String = ""
    var ad_url: String = ""
    var ad_desc: String = ""
    var orderno: String = ""
    var datetime: String = ""
    var islike: String = ""
    var isattent: String = ""
    var isstep: String = ""
    var isdialect: String = ""
}
