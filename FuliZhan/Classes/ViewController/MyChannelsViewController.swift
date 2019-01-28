//
//  MyChannelsViewController.swift
//  FuliZhan
//
//  Created by 123 on 2018/11/1.
//  Copyright © 2018 jingying. All rights reserved.
//

import UIKit
import SpriteKit
class MyChannelsViewController: UIViewController { 
    lazy private var collectionView : UICollectionView  = {
        let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: kTopHeight, width: screenWidth, height: screenHeight - kTopHeight), collectionViewLayout: MyChannelFlowLayout())
        //        collectionView.frame = CGRect(x: 0, y: kTopHeight, width: screenWidth, height: screenHeight - kTopHeight)
        //        collectionView.collectionViewLayout = MyChannelFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.gxj_registerCell(cell: channelCell.self)
        return collectionView
    }()
    var myChannels = [MyChannel]() {
        didSet {
            collectionView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "平台"
        setupUI()

        loadDatas()
        loadRefreshItem()
        loadLeftItem()
       
   
    }
    @objc func loadDatas() {
        NetworkTool.loadMyChannels1_6 { channels in
            self.myChannels = channels;
        }
    }
    func setupUI() {
        
        view.addSubview(collectionView)
        
    }
    
    
    
    
}
extension MyChannelsViewController{
    fileprivate func loadRefreshItem() {
        let rightItem = UIBarButtonItem.init(title: "刷新", style: .plain, target: self, action: #selector(loadDatas))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    fileprivate func loadLeftItem() {
        let rightItem = UIBarButtonItem.init(title: "🔞", style: .plain, target: self, action: #selector(thumblrContent))
        self.navigationItem.leftBarButtonItem = rightItem
    }
    
    /// 少儿不宜
    @objc func thumblrContent() {
        let thumblrVC = KYJPlayViewController()
        self.navigationController?.pushViewController(thumblrVC, animated: true)
        
        
    }

}

extension MyChannelsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myChannels.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.gxj_dequeueReusableCell(indexPath: indexPath) as channelCell
        cell.channel = self.myChannels[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = AnchorViewController()
        let video = myChannels[indexPath.row]
        vc.title = video.title;
        vc.address = video.name
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    
}

class MyChannelFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        //每个cell大小
        itemSize = CGSize(width: 80, height: 90)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollDirection = .vertical
    }
}

