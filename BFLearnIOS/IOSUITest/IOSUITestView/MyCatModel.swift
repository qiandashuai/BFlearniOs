//
//  MyCatModel.swift
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/5/12.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

import UIKit

class MyCatModel: NSObject {
    
    var name:String
    var catage: Int? // 可选属性，自定义的类型有一个逻辑上允许值为空的存储属性---无论是因为它无法在初始化时赋值，还是因为它在之后某个时机可以赋值为空--都需要将它声明为可选类型，可选类型的属性将自动化为nil, 表示这个属性是特意在构造过程设置为空。
    let catcolor: UIColor
    // 构造器可以通过调用其他构造器来完成实例的部分构造过程，叫做构造器代理，他能避免多个构造器间的代码重复
    
    // 类里面的所有存储型属性--包括所有继承自父类的属性---都必须在构造过程中设置初始值
    // 指定构造器和便利构造器
    
    
     init(catname: String) {
        name = catname
        catcolor = UIColor.yellow
        super.init()
    }
    
    init(catname:String, catage:Int) {
        name = catname
        self.catage = catage
        catcolor = UIColor.brown
        super.init()
    }
    
    // Swift 编译器的4种有效的安全检查
    
    // 1. 指定构造器必须保证她所在的类的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类的构造器。
    // 2. 指定构造器必须在为继承的属性设置新值前向上代理调用父类构造器
    // 3， 
}
