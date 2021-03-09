//
//  BFCollectionViewCell.swift
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/5/9.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

import UIKit
import SnapKit


class BFCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    /**
     五种访问级别：
     1. open 和 public 可以实体被同一模块源文件中所有实体访问，在模块外也可以通过导入该模块来访问源文件里的所有实体。
     2. internal 级别让实体被同一模块源文件中的任何实体访问，但是不能被模块外的实体访问，
     3. fileprivate 限制实体只能在其定义的文件内部访问，
     4. private 限制实体只能在其定义的作用域以及同一文件内的 extension 访问，
     */
}
