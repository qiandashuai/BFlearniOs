//
//  BFGCDSemaphoreLearn.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/2.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFGCDSemaphoreLearn.h"


// 主要是为了学习 GCD 的 semaphore ,
// 内容主要来源于 https://xiaozhuanlan.com/topic/4365017982
// dispatch_semaphore 是持有记数的信号，该信号是多线程编程中的计数类型信号。使用计数来实现该功能，计数为0时等待，计数为1时放行。
// 信号量的使用比较简单，主要就三个API：create、wait和signal。
// 使用篇:
// `dispatch_semaphore_create` : 可以生成信号量，参数 value 时信号量的初始值;value < 0， 返回NULL value = 0, 多线程在等待某个特定线程的结束。 value > 0, 资源数量，可以由多个线程使用。
// `dispatch_semaphore_wait`: 会让信号量值减一，当信号量为0时会等待，否则正常执行。等待资源释放。如果传入的sema大于0，就继续向下执行，并将信号量减1；如果dsema等于0，阻塞当前线程等待资源被dispatch_semaphore_signal释放。如果等到了信号量，继续向下执行并将信号量减1，如果一直没有等到信号量，就等到timeout再继续执行。dsema不能传入NULL。

// dispatch_semaphore-singal 会让信号量值加一，如果有通过 `dispatch_semaphore_wait` 函数等待 dispatch semaphore 的计数值增加的线程，会由系统唤醒最先等待的线程执行。

// 常见用法:
// 1. 用于对资源进行加锁操作，防止多线程访问修改数据出现结果不一致甚至崩溃的问题。
@implementation BFGCDSemaphoreLearn



- (void)testSemaphore {
    /**
     2020-07-09 14:29:21.836692+0800 BFLearnIOS[2730:192143] for 循环 i: 0, sourceArrCount: 5
     2020-07-09 14:29:21.836853+0800 BFLearnIOS[2730:192143] 开始任务 -- 线程: <NSThread: 0x600001f0d940>{number = 1, name = main}
     2020-07-09 14:29:22.838260+0800 BFLearnIOS[2730:192143] source的值  4
     2020-07-09 14:29:22.838762+0800 BFLearnIOS[2730:192143] for 循环 i: 1, sourceArrCount: 4
     2020-07-09 14:29:22.839391+0800 BFLearnIOS[2730:192143] 开始任务 -- 线程: <NSThread: 0x600001f0d940>{number = 1, name = main}
     2020-07-09 14:29:23.842525+0800 BFLearnIOS[2730:192143] source的值  3
     2020-07-09 14:29:23.843022+0800 BFLearnIOS[2730:192143] for 循环 i: 2, sourceArrCount: 3
     2020-07-09 14:29:23.843287+0800 BFLearnIOS[2730:192143] 开始任务 -- 线程: <NSThread: 0x600001f0d940>{number = 1, name = main}
     2020-07-09 14:29:24.843634+0800 BFLearnIOS[2730:192143] source的值  2
     2020-07-09 14:29:24.844012+0800 BFLearnIOS[2730:192143] end
     */
    __block NSInteger sourceArrcount = 5;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1); // 创建一个信号量。
    
    for (NSInteger i = 0; i < sourceArrcount; i ++) {
        NSLog(@"for 循环 i: %ld, sourceArrCount: %ld", i, sourceArrcount);
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); //  1. 信号量-1，为0，往下执行在子线程开辟一个异步任务A 2. 因为信号为0，无法再减一，卡死在主线程

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

            NSLog(@"开始任务 -- 线程: %@",[NSThread currentThread]);
            [NSThread sleepForTimeInterval:1];
            sourceArrcount -- ;
            NSLog(@"source的值  %ld", sourceArrcount);
            dispatch_semaphore_signal(semaphore);
        });
    }
   // dispatch_semaphore_signal(semaphore);
    /**
     2020-07-09 14:35:39.214457+0800 BFLearnIOS[2788:195914] for 循环 i: 0, sourceArrCount: 5
     2020-07-09 14:35:39.214662+0800 BFLearnIOS[2788:195914] 开始任务 -- 线程: <NSThread: 0x6000035de880>{number = 1, name = main}
     2020-07-09 14:35:40.215808+0800 BFLearnIOS[2788:195914] source的值  4
     2020-07-09 14:35:40.216107+0800 BFLearnIOS[2788:195914] for 循环 i: 1, sourceArrCount: 4
     */
    NSLog(@"end");
    /**
     2020-07-09 11:39:34.483012+0800 BFLearnIOS[2000:96755] for 循环 i: 0, sourceArrCount: 5
     2020-07-09 11:39:34.483183+0800 BFLearnIOS[2000:96755] for 循环 i: 1, sourceArrCount: 5
     2020-07-09 11:39:34.483233+0800 BFLearnIOS[2000:96861] 开始任务 -- 线程: <NSThread: 0x600002f70480>{number = 7, name = (null)}
     2020-07-09 11:39:35.486420+0800 BFLearnIOS[2000:96861] source的值  4
     2020-07-09 11:39:35.486837+0800 BFLearnIOS[2000:96755] for 循环 i: 2, sourceArrCount: 4
     2020-07-09 11:39:35.486894+0800 BFLearnIOS[2000:96861] 开始任务 -- 线程: <NSThread: 0x600002f70480>{number = 7, name = (null)}
     2020-07-09 11:39:36.490799+0800 BFLearnIOS[2000:96861] source的值  3
     2020-07-09 11:39:36.491026+0800 BFLearnIOS[2000:96755] end
     2020-07-09 11:39:36.491074+0800 BFLearnIOS[2000:96861] 开始任务 -- 线程: <NSThread: 0x600002f70480>{number = 7, name = (null)}
     2020-07-09 11:39:37.492016+0800 BFLearnIOS[2000:96861] source的值  2

     */
}

/**
 dispatch_semaphore_t :
 dispatch_semaphore_create： 信号量创建
 */


- (void)testSemaphore2 {
    dispatch_semaphore_t semaphore_t = dispatch_semaphore_create(1);
    dispatch_semaphore_wait(semaphore_t, DISPATCH_TIME_FOREVER);
    
    NSLog(@"测试当前线程");
    
    dispatch_semaphore_signal(semaphore_t);
    NSLog(@"只想啥呢");
}
/**
 原理篇:
 
 dispatch_semaphore_t 首先看一下 `dispatch_semaphore_s`
 
 dispatch_semaphore_create: 用于创建信号量，创建时需要指定 value, 内部将 value 的值存储到 desma_value(当前的value)和desma_orig(初始value)中，value的值必须大于或者等于0
 */

@end
