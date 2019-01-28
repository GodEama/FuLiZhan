//
//  SmallVideoPlayerCustomView.swift
//  FuliZhan
//
//  Created by 123 on 2019/1/28.
//  Copyright © 2019 jingying. All rights reserved.
//

import BMPlayer

class SmallVideoPlayerCustomView: BMPlayerControlView {
    
    override func customizeUIComponents() {
        BMPlayerConf.topBarShowInCase = .none
        playButton.removeFromSuperview()
        currentTimeLabel.removeFromSuperview()
        totalTimeLabel.removeFromSuperview()
        timeSlider.removeFromSuperview()
        fullscreenButton.removeFromSuperview()
        progressView.removeFromSuperview()
    }
    
}
