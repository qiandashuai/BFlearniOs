//
//  BFTableViewCell.swift
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/5/9.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

import UIKit
import Kingfisher

class BFTableViewCell: UITableViewCell {
    
    var contentLabel: UILabel = UILabel();
    var contentImage: UIImageView = UIImageView();
    lazy var cellModel: NSObject = MyCatModel(catname: "小花")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    /**
       存储属性: 将常量和变量存储为实例的一部分，而计算属性则是直接计算值，计算属性可以用于类，结构体和枚举，存储属性只能用于类和结构体。
     类属性，直接与类本身关联
     属性观察器来监控属性值的变化，
     
     结构体属于值类型，当值类型的实例被声明为常量的时候，他的所有属性也就成了常量
    引用类型，把一个引用类型的实例赋给一个常量后，依然可以修改改实例的可变属性。
     
     懒加载: lazy 来表示，表示当第一次被调用的时候才会计算其初始值。
     必须将延时加载属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延时加载。
     */
    
    /**
      属性包装器:
      属性包装器在管理属性如何存储和定义属性的代码之间添加了一个分隔层，
     */
    
    
    func commonInit() {
        let cat = MyCatModel(catname: "小黑", catage: 2)
        print(cat.name)
        contentLabel.frame = CGRect(x: 10, y: 10, width: 150, height: 80)
        contentLabel.textColor = UIColor.red
        contentLabel.text = "this is my book"
        contentView.addSubview(contentLabel)
        
        
        contentImage.frame = CGRect(x: 160, y: 10, width: 100, height: 100)
        contentImage.kf.setImage(with: URL(string:"https://pics4.baidu.com/feed/b812c8fcc3cec3fdb752aef448707239859427c5.jpeg?token=675321dd012fb82c6ec3b9ff17b3a840" ))
        contentView.addSubview(contentImage)
    }
    
    func updateWithString(_ str: String)  {
        self.contentLabel.text = str
    }

    // 可失败构造器
    // 所谓的失败：构造器传入无效的形参，或缺少某种所需的外部资源，又或者不满足某种必须要的条件。
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     自动引用计数:
       
     引用计数仅仅应用与类的实例，结构体和枚举类型是值类型，不是引用类型，也不是通过引用的方式存储和传递
     */
    
    
}
