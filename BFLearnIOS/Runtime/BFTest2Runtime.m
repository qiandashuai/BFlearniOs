//
//  BFTest2Runtime.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFTest2Runtime.h"

@implementation BFTest2Runtime


/**
 objc_msgSend: 作用
 objc_msgSend会做一下几件事情：
 1.检测这个 selector是不是要忽略的。
 2.检查target是不是为nil
 3.确定不是给nil发消息之后，在该class的缓存中查找方法对应的IMP实现。如果找到，就跳转进去执行。如果没有找到，就在方法分发表里面继续查找，一直找到NSObject为止。
 4.如果还没有找到，那就需要开始消息转发阶段了。至此，发送消息Messaging阶段完成。这一阶段主要完成的是通过select()快速查找IMP的过程。
 
 
 消息发送Messaging阶段—objc_msgSend源码解析
 */
- (void)foo{
    NSLog(@"done foo");
}

@end
