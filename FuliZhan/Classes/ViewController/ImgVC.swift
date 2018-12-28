//
//  ImgVC.swift
//  FuliZhan
//
//  Created by 123 on 2018/12/7.
//  Copyright © 2018 jingying. All rights reserved.
//

import UIKit
import Kingfisher
class ImgVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let imgView = UIImageView.init(frame: self.view.bounds)
        imgView.backgroundColor = .gray
        self.view.addSubview(imgView)
        imgView.kf.setImage(with: URL(string: "https://gagayi.oss-cn-beijing.aliyuncs.com/video/river.jpg"))
        
    }
    

    

}
