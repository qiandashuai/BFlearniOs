//
//  JSNativeLearn.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/17.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "JSNativeLearn.h"
#import <JavaScriptCore/JavaScriptCore.h>

/**
 JSCore: 专门用来解释和执行 JS 代码。
 JSValue: JS 和 OC 中数据转换，他用来表示 JS 中的数据。
 JSContext: JS 执行的上下文，
 JSVirtualMachine: JS的虚拟机，有独立的堆空间和垃圾回收机制，它主要为JS 执行提供资源保证。
 JSExport: 把 OC 中的属性和方法导出到JS 环境中，方便在 JS 中调用
 */

/**
 JS 与 OC 通信
 
 JS 与 oC 通信，目前的两个方式:
 1. 通过 JSCore 中的 Block
 2. 通过 JSCore 中的 JSExport
 */


/**
 JSVirtualMachine: 实例代表一个自包含的 JS 的运行环境，或者是一系列 JS 运行需要的资源，该类主要有两个用途，一是支持并发的 JS 调用，二是管理 JS 和 Native 之间桥对象的内存。而且每一个JSContext（下节介绍）都从属于一个JSVM，每个JSVM都有自己独立的堆空间，不同的JSVM之间是无法传递值的
 */


@interface JSNativeLearn()

@property(nonatomic, strong) JSContext *context;

@end

@implementation JSNativeLearn


- (void)testJSValue {
    
    self.context = [[JSContext alloc]initWithVirtualMachine:[[JSVirtualMachine alloc]init] ];
    JSValue *intValue = [JSValue valueWithInt32:10 inContext:self.context];
    JSValue *boolValue = [JSValue valueWithBool:YES inContext:self.context];
    
    JSValue *person = [JSValue valueWithNewObjectInContext:self.context];
    [person setObject:@"baofeng" forKeyedSubscript:@"name"];
    [person setObject:@25 forKeyedSubscript:@"age"];
    
    NSLog(@"this is person name %@", person[@"name"]);
    NSLog(@"this is age %d", person[@"age"].toInt32);
    
    NSLog(@"int valye is %d", intValue.toInt32);
    
    [self.context evaluateScript:@"function add(a, b){return a + b}"];
    
    JSValue *addValue = [self.context[@"add"] callWithArguments:@[@3,@3]];
    NSLog(@"add value  is %d", addValue.toInt32);
}


- (void)logSomeName {
    NSLog(@"this is context call method");
}
@end
