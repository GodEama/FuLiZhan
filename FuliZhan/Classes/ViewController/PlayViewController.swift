//
//  PlayViewController.swift
//  FuliZhan
//
//  Created by 123 on 2018/11/5.
//  Copyright © 2018 jingying. All rights reserved.
//

import UIKit
import IJKMediaFramework

class PlayViewController: UIViewController{
    
    var playUrl : String  = ""
    var isHidden : Bool = true
    
    lazy var player: IJKFFMoviePlayerController = IJKFFMoviePlayerController(contentURLString: playUrl, with: IJKFFOptions.byDefault())
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        player.scalingMode = .aspectFit
        player.setPauseInBackground(true)
        self.view.addSubview(player.view)
        let view1 = UIView()
        view1.backgroundColor = .clear
        view1.frame = self.view.bounds
        self.view.addSubview(view1)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showNav))
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
