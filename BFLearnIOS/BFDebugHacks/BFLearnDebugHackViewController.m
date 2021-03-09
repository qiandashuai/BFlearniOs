//
//  BFLearnDebugHackViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/7/14.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnDebugHackViewController.h"

@interface BFLearnDebugHackViewController ()

@end

@implementation BFLearnDebugHackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}



/**
 内存模型: Stack
 
 除了 Heap 以外，其他的内存占用叫做 Stack（栈）, 简单来说，stack 是由于函数运行而临时占用的内存区域
 栈是由内存区域的结束地址开始，从高位(地址)向地位(地址)分配，比如，内存区域的结束地址是
 
 EAX, EBX, ECX, EDX< EDI, ESI, EBP, ESP
 
 PUSH 指令: 程序从__main 标签开始执行，
 
push %ebx: 这一行里面， push 是CPU指令，%ebx是该指令要用到的运算子，一个CPU指令可以有零个到多个运算子。
 
 */

/**
 消息转发:
 
 由于 Objective-C中的消息转发(message forwarding)机制, 如果在编译期向对象发送了其无法解读的消息并没什么大碍，因为当运行期间对象接收到无法解读的对象后，他可以通过开启消息转发机制来做一些补救措施，
 */
@end
