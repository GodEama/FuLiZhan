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
    }
    
    
    @objc func loadAnchors() {
        NetworkTool.loadMyAnchors(address: address) { anchors in
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
