//
//  AnchorTableViewCell.swift
//  FuliZhan
//
//  Created by 123 on 2018/11/1.
//  Copyright © 2018 jingying. All rights reserved.
//

import UIKit

class AnchorTableViewCell: UITableViewCell,RegisterCellFromNib {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var anchor = Video(){
        didSet{
            nameLabel.text = anchor.title
//            addressLabel.text = anchor.address
//            imgView.kf.setImage(with: URL(string: (anchor.img)))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
