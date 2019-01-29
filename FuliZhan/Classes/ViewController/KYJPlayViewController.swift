//
//  KYJPlayViewController.swift
//  FuliZhan
//
//  Created by 123 on 2019/1/26.
//  Copyright © 2019 jingying. All rights reserved.
//

import UIKit
import IJKMediaFramework
import SVProgressHUD
import Kingfisher
import BMPlayer

class KYJPlayViewController: UIViewController {
    var playUrl : String  = ""
    var videos : NSMutableArray = [];
    var video : InfoItem = InfoItem()
    var isHidden : Bool = true
    var page = 1
    var playIndex = 0
    let imageView : UIImageView = UIImageView()
    let view1 : UIView = UIView()
    let playView : UIView = UIView()
    
    
    private lazy var player = BMPlayer(customControlView: SmallVideoPlayerCustomView(frame:CGRect.zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.frame = self.view.bounds
        imageView.center = self.view.center;
        self.view.addSubview(imageView)
        
        let effect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = imageView.bounds;
        imageView.addSubview(effectView)
        
        self.view.backgroundColor = .white
        
        playView.frame = self.view.bounds
        playView.backgroundColor = .clear
        view.addSubview(playView)
        player.backgroundColor = .clear
        playView.addSubview(self.player)
        self.player.delegate = self as BMPlayerDelegate;
        
        view1.backgroundColor = .clear
        view1.frame = self.view.bounds
        self.view.addSubview(view1)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showNav))
        
        
        
        view1.addGestureRecognizer(gesture)
        
        
        let swipDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(upPlay))
        swipDown.direction = [.down]
        
        view1.addGestureRecognizer(swipDown)
        
        let swipUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(nextPlay))
        swipUp.direction = [.up]
        
        view1.addGestureRecognizer(swipUp)
        
        loadDatas()
    
        loadDownloadItem()
        
    }
    
    func playWithVideo(index:NSInteger) {
//        NotificationCenter.default.removeObserver(self)
        playIndex = index
        let vi : InfoItem = self.videos[index] as! InfoItem
        playUrl = vi.href
        self.imageView.kf.setImage(with: URL(string: (vi.thumb)))
        let titleLab = UILabel()
        titleLab.text = vi.title
        titleLab.textColor = .white
        
        
        DispatchQueue.main.async {
            
            if self.player.isPlaying { self.player.pause() }
            // 先把 bgImageView 的子视图移除，再添加
            for subview in self.playView.subviews { subview.removeFromSuperview() }
            self.playView.addSubview(self.player)
            self.player.snp.makeConstraints({ $0.edges.equalTo(self.playView) })
            self.playView.addSubview(titleLab)
            titleLab.snp.makeConstraints {
                $0.bottom.equalTo(self.playView).offset(-40)
                $0.left.equalTo(self.playView).offset(18)
                $0.right.lessThanOrEqualTo(self.playView).offset(-18)
            }
            let asset = BMPlayerResource(url: URL(string: self.playUrl)!)
            self.player.setVideo(resource: asset)
            self.player.play()
        }
        
        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.player.pause()
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc func showNav() {
        if self.player.isPlaying {
            self.player.pause()
            self.navigationController?.isNavigationBarHidden = false
            isHidden = false
        }
        else{
            self.player.play()
            self.navigationController?.isNavigationBarHidden = true
            self.isHidden = true
        }
//        if !isHidden {
//            return
//        }
//
//        self.navigationController?.isNavigationBarHidden = false
//        isHidden = false
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute:
//            {
//                self.navigationController?.isNavigationBarHidden = true
//                self.isHidden = true
//        })
    }
    
   
    
    @objc func moviePlayBackDidFinish(_ notification : NSNotification){
//        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    deinit {
        player.pause()
//        NotificationCenter.default.removeObserver(self)
    }
  

}
extension KYJPlayViewController:BMPlayerDelegate {
    func bmPlayer(player: BMPlayer, loadedTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playTimeDidChange currentTime: TimeInterval, totalTime: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerIsPlaying playing: Bool) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerOrientChanged isFullscreen: Bool) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerStateDidChange state: BMPlayerState){
        switch state {
        case .notSetURL:
            SVProgressHUD.showInfo(withStatus: "未设置URL")
            break
        case .readyToPlay:
            SVProgressHUD.showInfo(withStatus: "准备播放")
            break
        case .playedToTheEnd:
            self.nextPlay()
            break
        default:
            SVProgressHUD.dismiss()
        }
    }
}

extension KYJPlayViewController{
    func loadDatas()  {
        NetworkTool.loadKYJVideos(page: self.page) { v in
            if self.page <= 1{
                self.videos.removeAllObjects()
                self.videos.addObjects(from: v)
                self.playWithVideo(index: 0)
            }else{
                self.videos.addObjects(from: v)
                self.playWithVideo(index: self.playIndex + 1)
            }
        }
    }
    
    @objc func upPlay() {
        if self.videos.count > 0 {
            if self.playIndex == 0{
                self.page = 1
                self.loadDatas()
            }
            else{
                self.playWithVideo(index: self.playIndex - 1)
            }
        }
    }
    
    @objc func nextPlay() {
        if self.videos.count > 0 {
            if self.playIndex + 1 == self.videos.count{
                self.page = self.page + 1;
                self.loadDatas()
            }
            else{
                self.playWithVideo(index: self.playIndex + 1)
            }
        }
    }
    
    @objc func downLoadVideo() {
        if self.playUrl.hasPrefix("http") {
             NetworkTool.downloadVideo(url: self.playUrl)
        }
       
    }
    
    fileprivate func loadDownloadItem() {
        let rightItem = UIBarButtonItem.init(title: "download video", style: .plain, target: self, action: #selector(downLoadVideo))
        self.navigationItem.rightBarButtonItem = rightItem
    }
}


