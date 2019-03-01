//
//  channelCell.swift
//  FuliZhan
//
//  Created by 123 on 2018/11/1.
//  Copyright © 2018 jingying. All rights reserved.
//

import UIKit
import Kingfisher

class channelCell: UICollectionViewCell,RegisterCellFromNib {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    var channel = MyChannel(){
        didSet{
            nameLabel.text = channel.title + "(" + channel.Number + ")"
            imgView.kf.setImage(with: URL(string: (channel.xinimg)))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 25;
    }

}
