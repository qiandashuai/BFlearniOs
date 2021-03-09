//
//  BFLearnBlock.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/23.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnBlock.h"

@implementation BFLearnBlock

- (void)testBlock {
    int val = 63;
    void (^blk)(void) = ^{
        NSLog(@"this is good  = %d", val);
    };
    val = 10;
    blk();
    
    // block 其实可以封装了函数调用和函数环境的 OC 对象
    // block 底层结构就是 __main_block_impl_0 结构体，内部包含了 impl结构体和 desc 结构体以及外部需要访问的变量，block 将需要执行的代码放到一个函数里，
    // block 将需要执行的代码放到一个函数里，impl 内部的 funcprt 指向这个函数的地址，通过地址调用这个函数，就可以执行blicj里面的代码了，desc 用来描述block
    // 内部的 reserved 做保留，block_size 描述 block占用内存
    
    // block 在实现的时候就会对它引用的到它所在方法定义的栈变量进行一次只读拷贝，然后在 Block 块内使用该只读拷贝，block 捕获的是局部变量的副本。
    
    // Block 语法大全：
    // return_type: 表示返回的对象/关键字等
    // blockName: 表示 block 的名称
    // var_type: 表示参数的类型(可以是void,并省略)
    // varname 表示参数名称
    
    // return_type (^blockName)(var_type) = ^return_type(var_type var_name) {
    // }
    
    // __block 存储域类说明符，存储域说明会指定变量存储的域。
    
    // 在 ARC 下 Block 访问 auto 变量时系统默认帮我们进行了 copy 操作。NSGlobalBlock 访问了 auto 变量时会变成 NSStackBlock 当 NSStackBlock 进行copy 操作后变成 NSMallocBlock
    
    // 在 ARC 环境下，编译器会根据以下几种情况自动将 栈上的block 复制到堆上:
    /**
        1 。block 作为函数返回值 比如使用 =
        2 。将 block 赋值给 __strong 指针
        3 。block 作为 Cocoa API 中方法名含有 usingBlock 的方法参数时
        4 。block 作为 GCD API 的方法参数时.
     */
    /**
     对象类型的 auto 变量
     
        - 当 block 内部访问了对象类型的 auto变量 时: 如果 block 在栈空间，不管外部环境是强引用，弱引用，block 都会弱引用访问对象， 如果在堆空间，如果外部强引用，block内部也是强引用，如果外部是弱引用，block
     内部也是弱引用
        - 栈 block: 如果 block 是在栈上，将不会对 auto 变量产生强引用。栈上的block 会随时销毁，所以没必要强引用其它对象
        - 堆 block: 如果 block 被拷贝到堆上，1。。 会调用 block 内部的 copy 函数， copy 函数内部会调用 _Block_object_assign 函数， _Block_object_assign 函数会根据 auto 变量的修饰符 __strong, __weak, __unsafe_unretained 作出相应的操作，形成强引用或者弱引用。
        - 如果 block 从堆上移除: 会调用 block 内部的 dispose 函数， dispose 函数内部会调用 _Block_object_dispose 函数，_Block_object_dispose 函数会自动释放引用的 auto 变量 (release, 引用计数 -1, 若为 0, 则销毁)
     */
    
    /**
    __block 修饰符:
        - 可以用于解决 block 内部无法修改 auto变量值的问题
        - __block 不能修饰全局变量，静态变量 static
     
     __ block 修饰符原理:
        编译器会将 __block 变量包装成一个结构体 __Block_byref_Age_0, 结构体内部 *forwarding 是指向自身的指针，内部还存储着外部 auto 变量的值，
     __ block 的 forwarding 指针如下:
            栈上，__block 结构体中的 __forwarding 指针指向自己，一旦复制到堆上，栈上的__block 结构体中的 _Fowaeding 指针会指向 堆上的 __block 结构体， 堆上__block结构体中的 __forwarding 还是指向自己，
     假设 age是栈上的变量。这个
     */
    /**
     iOS 面试之 block 篇:
     Block 本质是什么? 一共有多少种 block ，什么情况下生成
     */
    
}


- (void)testHandleBlock:(handleBlock)handleBlock {
    handleBlock();
}

- (void)testRetuenBloackName:(void (^)(NSString * _Nonnull))returnName {
    returnName(@"this is return block");
}


//- (NSString *(^)(NSString *name))getAUserName {
//    return ^
//}

// Block 与内存管理

/**
 Block 在内存中的位置分为三种类型
 
 - NSGlobalBlock 是位于全局区的 Block， 他是设置在程序的数据区域(.data区)中。
 - NSStackBlock 是位于栈区，超出变量作用域，栈上的 Block 以及 __block 变量都被销毁
 - NSMallocBlock 是位于堆区，在变量作用域结束时不受影响。
 在 ARC 开启的情况下，将只会有 NSConcreteGlobalBlock 和 NSConcreteMallocBlock 类型的 block。
 
 位于全局区: GlobalBlock:

 生成在全局区 block 有两个情况
   - 定义全局变量的地方有 block 语法时
   - block 语法的表达式中没有使用截获的自动变量
 */

@end
