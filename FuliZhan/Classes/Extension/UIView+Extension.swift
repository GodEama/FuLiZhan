//
//  UIView+Extension.swift
//  News_swift
//
//  Created by 123 on 2018/10/17.
//  Copyright © 2018年 jingying. All rights reserved.
//

import UIKit

protocol RegisterCellFromNib {}
extension UIView{
    static var identifier:String {return "\(self)"}
    static var nib:UINib?{return UINib(nibName: "\(self)", bundle: nil)}
    
}
