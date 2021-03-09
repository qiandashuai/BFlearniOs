//
//  BFGCDOperationLearn.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/7/9.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFGCDOperationLearn.h"


@interface BFTestOPeration : NSOperation

@end

@implementation BFTestOPeration

- (void)main {
    if (!self.isCancelled) {
        for (int i = 0; i < 4; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"11-----%@",[NSThread currentThread]);
        }
    }
    /**
     2020-07-09 16:11:45.337465+0800 BFLearnIOS[3406:274007] 11-----<NSThread: 0x600002b581c0>{number = 1, name = main}
     2020-07-09 16:11:46.339011+0800 BFLearnIOS[3406:274007] 11-----<NSThread: 0x600002b581c0>{number = 1, name = main}
     2020-07-09 16:11:47.339866+0800 BFLearnIOS[3406:274007] 11-----<NSThread: 0x600002b581c0>{number = 1, name = main}
     2020-07-09 16:11:48.341392+0800 BFLearnIOS[3406:274007] 11-----<NSThread: 0x600002b581c0>{number = 1, name = main}

     */
}


@end


@implementation BFGCDOperationLearn

/**
 NSOperation 需要配合 NSOperationQueue 来实现多线程，因为默认情况下，NSOperation单独使用时系统同步执行操作，配合 NSOperationQueue 我们能更好的实现异步执行。
 */
/**
 NSOperation 是一个抽象类, 所以必须使用其子类,有三种方法来封装:
 
 1.  使用子类 NSInvocationOperation
 2. 使用子类 NSBlockOperation
 3. 自定义即成自 NSOperation 的子类，通过实现内部相应的方法来封装操作。
 */



- (void)testSubOperation {
    BFTestOPeration *bfOp = [[BFTestOPeration alloc]init];
    [bfOp start];
}

- (void)useBlockOperation {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for (int  i = 0; i< 4; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    }];
    
    /**
     2020-07-09 16:03:33.536040+0800 BFLearnIOS[3285:265839] 1----<NSThread: 0x600001b49100>{number = 1, name = main}
     2020-07-09 16:03:35.537616+0800 BFLearnIOS[3285:265839] 1----<NSThread: 0x600001b49100>{number = 1, name = main}
     2020-07-09 16:03:37.538663+0800 BFLearnIOS[3285:265839] 1----<NSThread: 0x600001b49100>{number = 1, name = main}
     2020-07-09 16:03:39.540241+0800 BFLearnIOS[3285:265839] 1----<NSThread: 0x600001b49100>{number = 1, name = main}
     */
    
    [op addExecutionBlock:^{
        for (int  i = 0; i< 4; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"2----%@",[NSThread currentThread]);
        }
    }];
    
    [op addExecutionBlock:^{
        for (int  i = 0; i< 4; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"3----%@",[NSThread currentThread]);
        }
    }];
    
    /**
     addExecutionBlock 会开启新的线程
     */
    
    /**
     2020-07-09 16:05:27.211846+0800 BFLearnIOS[3334:268170] 3----<NSThread: 0x6000037f71c0>{number = 7, name = (null)}
     2020-07-09 16:05:27.211846+0800 BFLearnIOS[3334:267910] 1----<NSThread: 0x600003788b00>{number = 1, name = main}
     2020-07-09 16:05:27.211852+0800 BFLearnIOS[3334:268008] 2----<NSThread: 0x6000037d30c0>{number = 3, name = (null)}
     2020-07-09 16:05:28.213156+0800 BFLearnIOS[3334:267910] 1----<NSThread: 0x600003788b00>{number = 1, name = main}
     2020-07-09 16:05:28.213156+0800 BFLearnIOS[3334:268008] 2----<NSThread: 0x6000037d30c0>{number = 3, name = (null)}
     2020-07-09 16:05:28.213156+0800 BFLearnIOS[3334:268170] 3----<NSThread: 0x6000037f71c0>{number = 7, name = (null)}
     2020-07-09 16:05:29.214686+0800 BFLearnIOS[3334:268170] 3----<NSThread: 0x6000037f71c0>{number = 7, name = (null)}
     2020-07-09 16:05:29.214686+0800 BFLearnIOS[3334:267910] 1----<NSThread: 0x600003788b00>{number = 1, name = main}
     2020-07-09 16:05:29.214702+0800 BFLearnIOS[3334:268008] 2----<NSThread: 0x6000037d30c0>{number = 3, name = (null)}
     2020-07-09 16:05:30.216267+0800 BFLearnIOS[3334:268170] 3----<NSThread: 0x6000037f71c0>{number = 7, name = (null)}
     2020-07-09 16:05:30.216267+0800 BFLearnIOS[3334:268008] 2----<NSThread: 0x6000037d30c0>{number = 3, name = (null)}
     2020-07-09 16:05:30.216274+0800 BFLearnIOS[3334:267910] 1----<NSThread: 0x600003788b00>{number = 1, name = main}
     */
    
   [op start];
    
}


- (void)useInvocationOperation {
    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task1) object:nil];
    [op start];
}

- (void)task1 {
    for (int  i = 0; i< 4; i ++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"1----%@",[NSThread currentThread]);
    }
    /**
     2020-07-09 15:54:37.068947+0800 BFLearnIOS[3204:257733] 1----<NSThread: 0x6000016761c0>{number = 1, name = main}
     2020-07-09 15:54:39.070630+0800 BFLearnIOS[3204:257733] 1----<NSThread: 0x6000016761c0>{number = 1, name = main}
     2020-07-09 15:54:41.072227+0800 BFLearnIOS[3204:257733] 1----<NSThread: 0x6000016761c0>{number = 1, name = main}
     2020-07-09 15:54:43.073532+0800 BFLearnIOS[3204:257733] 1----<NSThread: 0x6000016761c0>{number = 1, name = main}
     因为是主线程，会堵塞主线程, 会开启新线程
     */
}

- (void)testCustomeOperationQueue {
    
    // 自定义队列
    
    NSOperationQueue *customerQueue = [[NSOperationQueue alloc]init];
    customerQueue.maxConcurrentOperationCount = 2;
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task1) object:nil];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i  = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"2-2----custome--%@",[NSThread currentThread]);
        }
    }];
    
    [op2 addExecutionBlock:^{
        for (int i  = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"2-3----custome--%@",[NSThread currentThread]);
        }
    }];
    
    /**
     2020-07-09 16:36:51.748596+0800 BFLearnIOS[3543:293564] 2-2----custome--<NSThread: 0x600002f86940>{number = 7, name = (null)}
     2020-07-09 16:36:51.748596+0800 BFLearnIOS[3543:293562] 2-3----custome--<NSThread: 0x600002f83a40>{number = 6, name = (null)}
     2020-07-09 16:36:52.748878+0800 BFLearnIOS[3543:293569] 1----<NSThread: 0x600002fa0ec0>{number = 5, name = (null)}
     2020-07-09 16:36:52.748957+0800 BFLearnIOS[3543:293564] 2-2----custome--<NSThread: 0x600002f86940>{number = 7, name = (null)}
     2020-07-09 16:36:52.748957+0800 BFLearnIOS[3543:293562] 2-3----custome--<NSThread: 0x600002f83a40>{number = 6, name = (null)}
     2020-07-09 16:36:54.754286+0800 BFLearnIOS[3543:293569] 1----<NSThread: 0x600002fa0ec0>{number = 5, name = (null)}
     2020-07-09 16:36:56.756784+0800 BFLearnIOS[3543:293569] 1----<NSThread: 0x600002fa0ec0>{number = 5, name = (null)}
     2020-07-09 16:36:58.761077+0800 BFLearnIOS[3543:293569] 1----<NSThread: 0x600002fa0ec0>{number = 5, name = (null)}
     没有 BLock UI，
     */
//    [customerQueue addOperation:op2];
//    [customerQueue addOperation:op1];
    
    
    // 无需创建操作，直接在 block 中添加操作。直接将包含操作的 block 加入到队列中
    
    [customerQueue addOperationWithBlock:^{
        for (int  i = 0; i < 4; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"1 ----- %@",[NSThread currentThread]);
        }
    }];
    
    [customerQueue addOperationWithBlock:^{
        for (int  i = 0; i < 4; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"2 ----- %@",[NSThread currentThread]);
        }
    }];
    
    [customerQueue addBarrierBlock:^{
        NSLog(@"这是阻隔");
        /**
         2020-07-09 16:57:02.897551+0800 BFLearnIOS[4003:314390] 2 ----- <NSThread: 0x600002cc11c0>{number = 4, name = (null)}
         2020-07-09 16:57:02.897573+0800 BFLearnIOS[4003:314388] 1 ----- <NSThread: 0x600002ced500>{number = 6, name = (null)}
         2020-07-09 16:57:03.901239+0800 BFLearnIOS[4003:314390] 2 ----- <NSThread: 0x600002cc11c0>{number = 4, name = (null)}
         2020-07-09 16:57:03.901256+0800 BFLearnIOS[4003:314388] 1 ----- <NSThread: 0x600002ced500>{number = 6, name = (null)}
         2020-07-09 16:57:04.901766+0800 BFLearnIOS[4003:314390] 2 ----- <NSThread: 0x600002cc11c0>{number = 4, name = (null)}
         2020-07-09 16:57:04.901766+0800 BFLearnIOS[4003:314388] 1 ----- <NSThread: 0x600002ced500>{number = 6, name = (null)}
         2020-07-09 16:57:05.904424+0800 BFLearnIOS[4003:314388] 1 ----- <NSThread: 0x600002ced500>{number = 6, name = (null)}
         2020-07-09 16:57:05.904555+0800 BFLearnIOS[4003:314390] 2 ----- <NSThread: 0x600002cc11c0>{number = 4, name = (null)}
         2020-07-09 16:57:05.904979+0800 BFLearnIOS[4003:314388] 这是阻隔
         2020-07-09 16:57:06.908357+0800 BFLearnIOS[4003:314388] 3 ----- <NSThread: 0x600002ced500>{number = 6, name = (null)}
         2020-07-09 16:57:06.908360+0800 BFLearnIOS[4003:314392] 4 ----- <NSThread: 0x600002cc8300>{number = 3, name = (null)}
         2020-07-09 16:57:07.909691+0800 BFLearnIOS[4003:314392] 4 ----- <NSThread: 0x600002cc8300>{number = 3, name = (null)}
         2020-07-09 16:57:07.909691+0800 BFLearnIOS[4003:314388] 3 ----- <NSThread: 0x600002ced500>{number = 6, name = (null)}
         2020-07-09 16:57:08.913953+0800 BFLearnIOS[4003:314392] 4 ----- <NSThread: 0x600002cc8300>{number = 3, name = (null)}
         2020-07-09 16:57:08.913953+0800 BFLearnIOS[4003:314388] 3 ----- <NSThread: 0x600002ced500>{number = 6, name = (null)}
         2020-07-09 16:57:09.918354+0800 BFLearnIOS[4003:314392] 4 ----- <NSThread: 0x600002cc8300>{number = 3, name = (null)}
         2020-07-09 16:57:09.918359+0800 BFLearnIOS[4003:314388] 3 ----- <NSThread: 0x600002ced500>{number = 6, name = (null)}
         加了阻隔之后的结果
         */
    }];
    
    [customerQueue addOperationWithBlock:^{
        for (int  i = 0; i < 4; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"3 ----- %@",[NSThread currentThread]);
        }
    }];
    
    [customerQueue addOperationWithBlock:^{
        for (int  i = 0; i < 4; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"4 ----- %@",[NSThread currentThread]);
        }
    }];
    
    /**
     2020-07-09 16:55:48.484599+0800 BFLearnIOS[3934:312182] 1 ----- <NSThread: 0x600000129740>{number = 4, name = (null)}
     2020-07-09 16:55:48.484736+0800 BFLearnIOS[3934:312877] 2 ----- <NSThread: 0x600000101680>{number = 8, name = (null)}
     2020-07-09 16:55:48.484743+0800 BFLearnIOS[3934:312878] 3 ----- <NSThread: 0x6000001fde80>{number = 10, name = (null)}
     2020-07-09 16:55:48.484803+0800 BFLearnIOS[3934:312879] 4 ----- <NSThread: 0x600000109c40>{number = 9, name = (null)}
     2020-07-09 16:55:49.487151+0800 BFLearnIOS[3934:312182] 1 ----- <NSThread: 0x600000129740>{number = 4, name = (null)}
     2020-07-09 16:55:49.487158+0800 BFLearnIOS[3934:312879] 4 ----- <NSThread: 0x600000109c40>{number = 9, name = (null)}
     2020-07-09 16:55:49.487237+0800 BFLearnIOS[3934:312878] 3 ----- <NSThread: 0x6000001fde80>{number = 10, name = (null)}
     2020-07-09 16:55:49.487254+0800 BFLearnIOS[3934:312877] 2 ----- <NSThread: 0x600000101680>{number = 8, name = (null)}
     2020-07-09 16:55:50.491129+0800 BFLearnIOS[3934:312879] 4 ----- <NSThread: 0x600000109c40>{number = 9, name = (null)}
     2020-07-09 16:55:50.491124+0800 BFLearnIOS[3934:312877] 2 ----- <NSThread: 0x600000101680>{number = 8, name = (null)}
     2020-07-09 16:55:50.491124+0800 BFLearnIOS[3934:312182] 1 ----- <NSThread: 0x600000129740>{number = 4, name = (null)}
     2020-07-09 16:55:50.491124+0800 BFLearnIOS[3934:312878] 3 ----- <NSThread: 0x6000001fde80>{number = 10, name = (null)}
     2020-07-09 16:55:51.496395+0800 BFLearnIOS[3934:312879] 4 ----- <NSThread: 0x600000109c40>{number = 9, name = (null)}
     2020-07-09 16:55:51.496395+0800 BFLearnIOS[3934:312182] 1 ----- <NSThread: 0x600000129740>{number = 4, name = (null)}
     2020-07-09 16:55:51.496395+0800 BFLearnIOS[3934:312877] 2 ----- <NSThread: 0x600000101680>{number = 8, name = (null)}
     2020-07-09 16:55:51.496395+0800 BFLearnIOS[3934:312878] 3 ----- <NSThread: 0x6000001fde80>{number = 10, name = (null)}
     不会阻隔主线程
     */
    
}



// 主队列

- (void)testMianOperationQueue {
    
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
       NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task1) object:nil];
       
       NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
           for (int i  = 0; i < 2; i ++) {
               [NSThread sleepForTimeInterval:1];
               NSLog(@"2-2----custome--%@",[NSThread currentThread]);
           }
       }];
       
       [op2 addExecutionBlock:^{
           for (int i  = 0; i < 2; i ++) {
               [NSThread sleepForTimeInterval:1];
               NSLog(@"2-3----custome--%@",[NSThread currentThread]);
           }
       }];
    
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    /**
     2020-07-09 18:00:37.163485+0800 BFLearnIOS[7038:390946] 1----<NSThread: 0x6000031f6740>{number = 1, name = main}
     2020-07-09 18:00:38.164023+0800 BFLearnIOS[7038:390946] 1----<NSThread: 0x6000031f6740>{number = 1, name = main}
     2020-07-09 18:00:39.165331+0800 BFLearnIOS[7038:390946] 1----<NSThread: 0x6000031f6740>{number = 1, name = main}
     2020-07-09 18:00:40.167122+0800 BFLearnIOS[7038:390946] 1----<NSThread: 0x6000031f6740>{number = 1, name = main}
     2020-07-09 18:00:41.169322+0800 BFLearnIOS[7038:390946] 2-2----custome--<NSThread: 0x6000031f6740>{number = 1, name = main}
     2020-07-09 18:00:41.169374+0800 BFLearnIOS[7038:391316] 2-3----custome--<NSThread: 0x60000318ef80>{number = 7, name = (null)}
     2020-07-09 18:00:42.170683+0800 BFLearnIOS[7038:391316] 2-3----custome--<NSThread: 0x60000318ef80>{number = 7, name = (null)}
     2020-07-09 18:00:42.170684+0800 BFLearnIOS[7038:390946] 2-2----custome--<NSThread: 0x6000031f6740>{number = 1, name = main}
     并不会block 主线程，而是等主线程执行完了之后，添加在其后面执行
     */
    
    
}

@end
