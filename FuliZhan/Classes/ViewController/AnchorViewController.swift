//
//  AnchorViewController.swift
//  FuliZhan
//
//  Created by 123 on 2018/11/1.
//  Copyright © 2018 jingying. All rights reserved.
//

import UIKit

class AnchorViewController: UITableViewController {
    var address:String = "xiaobaobei.txt"
    var myAnchors = [Video](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.gxj_registerCell(cell: AnchorTableViewCell.self)
        tableView.tableFooterView = UIView()
        refreshControl = UIRefreshControl.init()
        refreshControl?.addTarget(self, action: #selector(loadAnchors), for: .touchDragExit)
        loadAnchors()
        loadRefreshItem()
    }
    
    
    @objc func loadAnchors() {
        NetworkTool.loadMyAnchors(param: ["name":address]) { anchors in
            self.refreshControl!.endRefreshing()
            self.myAnchors = anchors
        }
        
       
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.myAnchors.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.gxj_dequeueReusableCell(indexPath: indexPath) as AnchorTableViewCell
        cell.anchor = myAnchors[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenWidth + 42.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerVC = PlayViewController()
        let video = self.myAnchors[indexPath.row]
        playerVC.playUrl = video.address
        playerVC.title = video.title
        playerVC.video = video
        self.navigationController?.pushViewController(playerVC, animated: true)
        
    }



}
extension AnchorViewController{
    fileprivate func loadRefreshItem() {
        let rightItem = UIBarButtonItem.init(title: "刷新", style: .plain, target: self, action: #selector(loadAnchors))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
}
