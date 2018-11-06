//
//  UICollectionView+Extension.swift
//  News_swift
//
//  Created by 123 on 2018/10/17.
//  Copyright © 2018年 jingying. All rights reserved.
//

import UIKit

extension UICollectionView{
    func gxj_registerCell<T:UICollectionViewCell>(cell:T.Type) where T:RegisterCellFromNib  {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.identifier)
        }
        else{register(cell, forCellWithReuseIdentifier: T.identifier)}
    }
    
    func gxj_dequeueReusableCell<T:UICollectionViewCell>(indexPath:IndexPath) -> T where T:RegisterCellFromNib {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    /// 注册头部
    func gxj_registerSupplementaryHeaderView<T: UICollectionReusableView>(reusableView: T.Type) where T: RegisterCellFromNib {
        // T 遵守了 RegisterCellOrNib 协议，所以通过 T 就能取出 identifier 这个属性
        if let nib = T.nib {
            register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier)
        } else {
            register(reusableView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier)
        }
    }
    
    /// 获取可重用的头部
    func gxj_dequeueReusableSupplementaryHeaderView<T: UICollectionReusableView>(indexPath: IndexPath) -> T where T: RegisterCellFromNib {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
