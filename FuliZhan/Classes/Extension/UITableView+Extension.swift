//
//  UITableView+Extension.swift
//  News_swift
//
//  Created by 123 on 2018/10/17.
//  Copyright © 2018年 jingying. All rights reserved.
//

import UIKit

extension UITableView{
    func gxj_registerCell<T:UITableViewCell>(cell:T.Type) where T:RegisterCellFromNib  {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        }
        else{register(cell, forCellReuseIdentifier: T.identifier)}
    }
    
    func gxj_dequeueReusableCell<T:UITableViewCell>(indexPath:IndexPath) -> T where T:RegisterCellFromNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
