//
//  PlayViewController.swift
//  FuliZhan
//
//  Created by 123 on 2018/11/5.
//  Copyright © 2018 jingying. All rights reserved.
//

import UIKit
import IJKMediaFramework
import SVProgressHUD
import Kingfisher

class PlayViewController: UIViewController{
    
    var playUrl : String  = ""
    var video : Video = Video()
    var isHidden : Bool = true
    
    lazy var player: IJKFFMoviePlayerController = IJKFFMoviePlayerController(contentURLString: playUrl, with: IJKFFOptions.byDefault())
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: self.view.bounds)
//        imageView.contentMode = .scaleAspectFit
        imageView.center = self.view.center;
        imageView.kf.setImage(with: URL(string: (video.img)))
        self.view.addSubview(imageView)
        
        let effect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = imageView.bounds;
        imageView.addSubview(effectView)
        
        
        
        self.view.backgroundColor = .white
        player.scalingMode = .aspectFit
        player.setPauseInBackground(true)
        self.view.addSubview(player.view)
        let view1 = UIView()
        view1.backgroundColor = .clear
        view1.frame = self.view.bounds
        self.view.addSubview(view1)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showNav))
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadStateDidChange), name: NSNotification.Name.IJKMPMoviePlayerLoadStateDidChange, object: player)
        NotificationCenter.default.addObserver(self, selector: #selector(moviePlayBackDidFinish), name: NSNotification.Name.IJKMPMoviePlayerPlaybackDidFinish, object: player)
        
        view1.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        if !player.isPlaying() {
            player.prepareToPlay()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.player.stop()
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc func showNav() {
        if !isHidden {
            return
        }
        
        self.navigationController?.isNavigationBarHidden = false
        isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute:
            {
                self.navigationController?.isNavigationBarHidden = true
                self.isHidden = true
        })
    }
    
    @objc func loadStateDidChange(_ notification : NSNotification){
        switch player.loadState {
        case .stalled:
            SVProgressHUD.showInfo(withStatus: "loading……")
            break
        case .playthroughOK:
            SVProgressHUD.dismiss()
            break
        case .playable:
            SVProgressHUD.dismiss()
            break
        default:
            SVProgressHUD.dismiss()
        }
    }
    
    @objc func moviePlayBackDidFinish(_ notification : NSNotification){
        self.navigationController?.popViewController(animated: true)
      
    }
    
    
    deinit {
        player.shutdown()
        NotificationCenter.default.removeObserver(self)
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
