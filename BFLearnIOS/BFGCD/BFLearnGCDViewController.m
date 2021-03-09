//
//  BFLearnGCDViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/30.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnGCDViewController.h"
#import "BFLearnGCDTestView.h"
#import "BFGCDSemaphoreLearn.h"
#import "BFGCDOperationLearn.h"
#import <dispatch/dispatch.h>
#import "NSObject+BFSwizzle.h"
#import <objc/runtime.h>

@interface BFLearnGCDViewController ()

@property(nonatomic, strong) BFLearnGCDTestView *testView;
@property(nonatomic, copy) NSString *test1;



@end

/**
 一个 APP 就是一个进程
 
 
iOS 主线程/非主线程
 
 
 NSThread 表示一个线程
 */

@implementation BFLearnGCDViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];

//    [self testThread];
//    [self testThread2];
//
//    NSLog(@"%@",[NSThread currentThread]);
//    [self testMainThread];
   // [self testInterview5];
    
//    char *currentQueueLabel = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL);
//    dispatch_queue_t quque = dispatch_queue_create(@"com.bflearnios.qian", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(quque, ^{
//        char *current = dispatch_queue_get_label(quque);
//        NSLog(@"okok");
////    });
//    BOOL firstCmp =  strcmp(@"a", @"b");
//    int second =  strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_queue_create("com.baofeng.qian", DISPATCH_QUEUE_CONCURRENT)));
//    [self testDisPatchGroup];
    
//    NSError *error = NULL;
//    [BFLearnGCDViewController bf_swizzleMethod:@selector(originMethod) withMethod:@selector(altMethod) error:&error];
//    [self originMethod];
    
    int i = 10;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%d",i);
    });
    
    i = 20;
    NSLog(@"%d",i);
    
    [self nameWithInstane:self];
}

- (NSString *)nameWithInstane:(id)instance{
    unsigned int numIvars = 0;
    NSString *key = nil;
    Ivar *ivars = class_copyIvarList([self class], &numIvars);
    for (int i = 0; i < numIvars; i ++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType = [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        if ((object_getIvar(self, thisIvar)) == instance) {
            key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
            break;;
        }
    }
    free(ivars);
    
    return  key;
}

- (void)originMethod {
    NSLog(@"this is origin Class");
}

- (void)altMethod {
    [self altMethod];
    NSLog(@"this is alt method");
}


- (void)testDisPatchGroup {
    dispatch_group_t group = dispatch_group_create();
    NSArray *list = @[@"1",@"2",@"3"];
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(group);
        [self fetchConfiguretionWithCompletion:^(NSDictionary *dict) {
            dispatch_group_leave(group);
        }];
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"all reload complete");
    });
}

- (void)fetchConfiguretionWithCompletion:(void(^)(NSDictionary *dict))completion{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(2);
        !completion ? nil : completion(nil);
    });
}


- (void)testPerformSelector {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        NSLog(@"1----%@",[NSThread currentThread]);
        [self performSelector:@selector(testPer) withObject:nil afterDelay:0.f];
        NSLog(@"3---%@",[NSThread currentThread]);
        /**
        [self performSelector:@selector(testPer) withObject:nil afterDelay:0.f];
         2020-07-10 19:22:33.478038+0800 BFLearnIOS[9909:280785] 1----<NSThread: 0x60000376ac40>{number = 3, name = (null)}
         2020-07-10 19:22:33.478281+0800 BFLearnIOS[9909:280785] 3---<NSThread: 0x60000376ac40>{number = 3, name = (null)}
         原因是因为 performSelector withObejct:afterDelay 的本质是往 runloop 中添加定时器(即延迟时间是0秒)由于异步函数 dispatch_Async 是开启一个新的子线程去执行任务，而子线程默认是没有启动 runloop 的，所以并不会执行testPer 的方法
         */
        /**
        [self performSelector:@selector(testPer) withObject:nil];
         2020-07-10 19:22:58.656536+0800 BFLearnIOS[9948:281609] 1----<NSThread: 0x600001df2400>{number = 7, name = (null)}
         2020-07-10 19:22:58.660034+0800 BFLearnIOS[9948:281609] 2---<NSThread: 0x600001df2400>{number = 7, name = (null)}
         2020-07-10 19:22:58.660334+0800 BFLearnIOS[9948:281609] 3---<NSThread: 0x600001df2400>{number = 7, name = (null)}

         */
        
        /**
         改成同步会
         
         2020-07-10 19:26:43.313137+0800 BFLearnIOS[10009:285764] 1----<NSThread: 0x600002986300>{number = 1, name = main}
         2020-07-10 19:26:43.313361+0800 BFLearnIOS[10009:285764] 3---<NSThread: 0x600002986300>{number = 1, name = main}
         2020-07-10 19:26:43.338804+0800 BFLearnIOS[10009:285764] 2---<NSThread: 0x600002986300>{number = 1, name = main}
         */
    });
}


- (void)testInterviews {
    NSThread *thread = [[NSThread alloc]initWithBlock:^{
        NSLog(@"1---%@",[NSThread currentThread]);
    }];
    
    [thread start];
    
    [self performSelector:@selector(testPer) onThread:thread withObject:nil waitUntilDone:YES];
    /**
     原因是因为目标线程已经失活了，我们可以使用 runloop 来进行保活
     */
    /**
     2020-07-10 19:41:24.083232+0800 BFLearnIOS[10098:293917] 1---<NSThread: 0x6000010ae580>{number = 8, name = (null)}
     2020-07-10 19:41:29.565802+0800 BFLearnIOS[10098:293702] *** Terminating app due to uncaught exception 'NSDestinationInvalidException', reason: '*** -[BFLearnGCDViewController performSelector:onThread:withObject:waitUntilDone:modes:]: target thread exited while waiting for the perform'
     */
}

- (void)testInterview4 {
    NSLog(@"执行任务1 ---- %@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"执行任务2 --- %@",[NSThread currentThread]);
    });
    NSLog(@"执行任务3 --- %@", [NSThread currentThread]);
    /**
     2020-07-10 19:46:02.047095+0800 BFLearnIOS[10158:298478] 执行任务1 ---- <NSThread: 0x6000023a99c0>{number = 1, name = main}
     2020-07-10 19:46:02.047265+0800 BFLearnIOS[10158:298478] 执行任务3 --- <NSThread: 0x6000023a99c0>{number = 1, name = main}
     2020-07-10 19:46:02.073204+0800 BFLearnIOS[10158:298478] 执行任务2 --- <NSThread: 0x6000023a99c0>{number = 1, name = main}
     虽然异步执行有开启子线程的能力，但是主队列只会在主线程执行。
     */
}


- (void)testInterview5 {
    NSLog(@"执行任务1 --- %@",[NSThread currentThread]);
    
    dispatch_queue_t queue = dispatch_queue_create("com.test.baofeng.qian", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"执行任务2----%@",[NSThread currentThread]);
    
        dispatch_sync(queue, ^{
            NSLog(@"执行任务3 --- %@",[NSThread currentThread]);
        });
        
        NSLog(@"执行任务4---%@",[NSThread currentThread]);
    });
    
    NSLog(@"执行任务5---%@",[NSThread currentThread]);
    /**
     2020-07-10 19:55:10.815587+0800 BFLearnIOS[10227:306366] 执行任务1 --- <NSThread: 0x60000223c000>{number = 1, name = main}
     2020-07-10 19:55:10.815778+0800 BFLearnIOS[10227:306366] 执行任务5---<NSThread: 0x60000223c000>{number = 1, name = main}
     2020-07-10 19:55:10.815824+0800 BFLearnIOS[10227:306480] 执行任务2----<NSThread: 0x60000224b940>{number = 5, name = (null)}
     
     打印完成任务一之后，自己创建了一个串行队列，并通过异步函数向这个队列中添加r一个任务块,异步函数会开启一个子线程(block)m，开启子线程是要耗时的，所以会先执行任务5，
     同步函数天假的任务块需要立即执行，但是又是串行的，需要等待block1任务块执行完，相互等待，造成死锁。
     */
}


- (void)testInterview7 {
    
}

- (void)testPer {
    NSLog(@"2---%@",[NSThread currentThread]);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)testOperation {
    BFGCDOperationLearn *oplearn = [[BFGCDOperationLearn alloc]init];
    [oplearn testCustomeOperationQueue];
}

- (void)setupView {
    self.testView = [[BFLearnGCDTestView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.testView];
}


- (void)testMainThreadMainQueue {
    /**
     一个线程内可能有多个队列，这些队列可能是串行或者是并行的，按照同步或者异步的方式工作,
     队列是一个链表
     队列的类型: 队列的类型可以分为主队列，管理队列，自定义队列，全局队列。
     */
    
    
}


/**
 NSThread
 */

- (void)testThread {
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    [thread setName:@"thread1"];
    [thread setThreadPriority:0.7];
    [thread start];
}

- (void)run {
    NSLog(@"当前线程%@",[NSThread currentThread]);
}

- (void)testThread2 {
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    [thread setName:@"thread2"];
    [thread setThreadPriority:0.8];
    [thread start];
}

- (void)detachThread {
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}

/**
 DispatchQueue: 通过结构体和链表被实现为 FIFO的队列，而FIFO的队列是由dispatch_async等函数追加的Block来管理的。
 
 */
- (void)syncQueueTest {
    dispatch_queue_t queue = dispatch_queue_create("com.test.sync.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"this is test1");
    });
    dispatch_sync(queue, ^{
        NSLog(@"this is test2");
    });
    dispatch_sync(queue, ^{
        NSLog(@"this is test2");
    });
}


- (void)testMainThread {
    
    dispatch_queue_t mainqueue = dispatch_get_main_queue();
//    dispatch_sync(mainqueue, ^{
//        NSLog(@"this is ok");
//    });
    
    self.testView.titleLabel.text = @"这是已经完成的更新";
    
}
/**
 线程池: 一种线程使用模式。线程池维护着多个线程，等待着监督管理者分配可并发执行的任务。这避免了在处理短时间任务时创建与销毁线程的代价
 */


- (void)asynQueueTest {
    dispatch_queue_t queue = dispatch_queue_create("com.test.async.queue", DISPATCH_QUEUE_CONCURRENT);
    
}

- (void)mainQueueTest {
    // 主队列，主线程(UI)，普通的串行队列
    dispatch_queue_t mainqueue = dispatch_get_main_queue();
}


- (void)globalCurrentQueueTest {
    dispatch_queue_t globalqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}


/**
 GCD 使用步骤
 
 1. 创建一个队列(串行或并发)
 2. 将任务追加到任务的等待队列中，然后系统就会根据任务类型执行任务(同步执行或异步执行 )
 */

- (void)testThredFunc {
//    dispatch_queue_t queue = dispatch_queue_create("com.bf.thred", DISPATCH_QUEUE_CONCURRENT);
//
//
//    dispatch_queue_t queueSer = dispatch_queue_create("com.bf.serthread", DISPATCH_QUEUE_SERIAL);
//
//    dispatch_queue_t globalCurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
    
//    for (int i = 0; i < 1000; i ++) {
//        dispatch_async(queue, ^{
//            NSLog(@"%d当前的线程%@",i,[NSThread currentThread]);
//            [NSThread sleepForTimeInterval:0.5];
//        });
//    }
    
    //  创建任务
    
    // 创建同步任务
//    dispatch_sync(queue, ^{
//        NSLog(@"同步任务1%@",[NSThread currentThread]);
//    });
//
//    // 创建异步任务
//    dispatch_async(queue, ^{
//        NSLog(@"异步任务1%@",[NSThread currentThread]);
//    });
//
    // 同步执行+并发队列 ---> 没有开启新线程，串行执行
    
    
    // 同步执行+串行队列 ---> 没有开启新线程，串行执行
    
    // 异步执行+串行队列 ---> 开启新线程(1)条，串行执行任务
    
    // 异步执行+并发队列 ---> 开启新线程，并发执行任务
    
    // 同步执行+主队列 ---> 死锁，卡住不执行
    
    // 异步执行+主队列 ---> 串行执行任务，无新线程
}

// 同步执行+并发队列 ---> 没有开启新线程，串行执行，会在当前线程执行，并且阻塞当前线程
- (void)testConcSync {
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"代码块---begin");
    
    dispatch_queue_t concurQeuee = dispatch_queue_create("com.baofeng.test.conc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(concurQeuee, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"任务1 --- %@",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(concurQeuee, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:0.2];
            NSLog(@"任务2 --- %@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"代码块--- 结束");
    /**
     2020-07-06 15:42:42.956692+0800 BFLearnIOS[31067:3004559] <NSThread: 0x60000118dcc0>{number = 1, name = main}
     2020-07-06 15:42:42.956993+0800 BFLearnIOS[31067:3004559] 代码块---begin
     2020-07-06 15:42:43.957513+0800 BFLearnIOS[31067:3004559] 任务1 --- <NSThread: 0x60000118dcc0>{number = 1, name = main}
     2020-07-06 15:42:44.959002+0800 BFLearnIOS[31067:3004559] 任务1 --- <NSThread: 0x60000118dcc0>{number = 1, name = main}
     2020-07-06 15:42:45.160408+0800 BFLearnIOS[31067:3004559] 任务2 --- <NSThread: 0x60000118dcc0>{number = 1, name = main}
     2020-07-06 15:42:45.361163+0800 BFLearnIOS[31067:3004559] 任务2 --- <NSThread: 0x60000118dcc0>{number = 1, name = main}
     2020-07-06 15:42:45.361346+0800 BFLearnIOS[31067:3004559] 代码块--- 结束
     */
}

// 同步执行+串行队列 ---> 没有开启新线程，串行执行
- (void)testSerSync {
    
    NSLog(@"当前线程--->%@",[NSThread currentThread]);
    NSLog(@"代码块 ---> begin");
    
    dispatch_queue_t serQueue = dispatch_queue_create("com.bapfeng.test.series", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(serQueue, ^{
        for (int  i =0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"任务1 --- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(serQueue, ^{
       
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:0.2];
            NSLog(@"任务2 --- %@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"代码块 --- 结束");
    /**
     2020-07-06 15:50:20.978561+0800 BFLearnIOS[31371:3017231] 当前线程---><NSThread: 0x6000005facc0>{number = 1, name = main}
     2020-07-06 15:50:20.978848+0800 BFLearnIOS[31371:3017231] 代码块 ---> begin
     2020-07-06 15:50:21.980144+0800 BFLearnIOS[31371:3017231] 任务1 --- <NSThread: 0x6000005facc0>{number = 1, name = main}
     2020-07-06 15:50:22.981035+0800 BFLearnIOS[31371:3017231] 任务1 --- <NSThread: 0x6000005facc0>{number = 1, name = main}
     2020-07-06 15:50:23.181588+0800 BFLearnIOS[31371:3017231] 任务2 --- <NSThread: 0x6000005facc0>{number = 1, name = main}
     2020-07-06 15:50:23.383003+0800 BFLearnIOS[31371:3017231] 任务2 --- <NSThread: 0x6000005facc0>{number = 1, name = main}
     2020-07-06 15:50:23.383225+0800 BFLearnIOS[31371:3017231] 代码块 --- 结束
     */
}


// 异步执行+串行队列 ---> 开启新线程(1)条，串行执行任务, UI 可以继续执行。并没有 block 住
- (void)testAsyncSer {
    NSLog(@"当前线程 --- %@",[NSThread mainThread]);
    
    NSLog(@"代码块开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.baofeng.test.async.ser", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"当前任务1 ---> %@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:0.2];
            NSLog(@"当前任务2 ---> %@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"代码块 --- 结束");
    /**
     2020-07-06 16:03:19.185360+0800 BFLearnIOS[31876:3039583] 当前线程 --- <NSThread: 0x600000737d00>{number = 1, name = main}
     2020-07-06 16:03:19.185486+0800 BFLearnIOS[31876:3039583] 代码块开始
     2020-07-06 16:03:19.185611+0800 BFLearnIOS[31876:3039583] 代码块 --- 结束
     2020-07-06 16:03:20.187297+0800 BFLearnIOS[31876:3039748] 当前任务1 ---> <NSThread: 0x60000076a540>{number = 3, name = (null)}
     2020-07-06 16:03:21.188245+0800 BFLearnIOS[31876:3039748] 当前任务1 ---> <NSThread: 0x60000076a540>{number = 3, name = (null)}
     2020-07-06 16:03:21.392183+0800 BFLearnIOS[31876:3039748] 当前任务2 ---> <NSThread: 0x60000076a540>{number = 3, name = (null)}
     2020-07-06 16:03:21.596615+0800 BFLearnIOS[31876:3039748] 当前任务2 ---> <NSThread: 0x60000076a540>{number = 3, name = (null)}
     */
}


// 异步执行+并发队列 ---> 开启新线程，并发执行任务, UI 及时执行 不会被 block, 开启多个线程
- (void)testAsyncConccrent {
    NSLog(@"当前线程--->%@",[NSThread currentThread]);
    NSLog(@"代码块开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.baofeng.test.async.conccrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int  i =0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"当前任务1 ---> %@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:0.2];
            NSLog(@"当前任务2 ---> %@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"代码块结束");
    /**
     2020-07-06 16:09:06.979919+0800 BFLearnIOS[32112:3049831] 当前线程---><NSThread: 0x600003570c40>{number = 1, name = main}
     2020-07-06 16:09:06.980046+0800 BFLearnIOS[32112:3049831] 代码块开始
     2020-07-06 16:09:06.980143+0800 BFLearnIOS[32112:3049831] 代码块结束
     2020-07-06 16:09:07.184735+0800 BFLearnIOS[32112:3050001] 当前任务2 ---> <NSThread: 0x60000351c980>{number = 7, name = (null)}
     2020-07-06 16:09:07.388694+0800 BFLearnIOS[32112:3050001] 当前任务2 ---> <NSThread: 0x60000351c980>{number = 7, name = (null)}
     2020-07-06 16:09:07.984246+0800 BFLearnIOS[32112:3050004] 当前任务1 ---> <NSThread: 0x60000351c0c0>{number = 6, name = (null)}
     2020-07-06 16:09:08.988818+0800 BFLearnIOS[32112:3050004] 当前任务1 ---> <NSThread: 0x60000351c0c0>{number = 6, name = (null)}

     */
    
}

// 主线程同步，死锁 crash
- (void)testSyncMain {
    NSLog(@"当前线程%@",[NSThread currentThread]);
    NSLog(@"代码块开始");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    // 在此处 crash
    /**
     2020-07-06 16:18:18.538539+0800 BFLearnIOS[32476:3066842] 当前线程<NSThread: 0x6000009d63c0>{number = 1, name = main}
     2020-07-06 16:18:18.538958+0800 BFLearnIOS[32476:3066842] 代码块开始
     Thread 1: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)
     主要原因：死锁
      此任务在主线程执行，任务1被添加到主队列，要等待队列 testSyncMain任务执行完才会执行，然后，任务1是在testSyncMain这个任务中的，按照 FIFO的原则，testSyncMain 先添加到主队列，应该先执行完
     ，但是任务1在等待testSyncMain执行完才会执行，这样就造成了死锁。
     */
    dispatch_sync(queue, ^{
        for ( int  i = 0; i< 2; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"当前任务1 ---> %@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
       
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:0.2];
            NSLog(@"当前任务2 ---> %@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"代码块结束");
}

// 主线程异步, 不会 block UI
-(void)testAsyncMian {
    NSLog(@"当前线程 ---> %@",[NSThread currentThread]);
    NSLog(@"代码块开始");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"当前任务1 ---> %@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
       
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:0.2];
            NSLog(@"当前任务2 ---> %@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"代码块结束");
    /**
     2020-07-06 16:28:08.778011+0800 BFLearnIOS[32881:3084736] 当前线程 ---> <NSThread: 0x600001a0a1c0>{number = 1, name = main}
     2020-07-06 16:28:08.782765+0800 BFLearnIOS[32881:3084736] 代码块开始
     2020-07-06 16:28:08.783453+0800 BFLearnIOS[32881:3084736] 代码块结束
     2020-07-06 16:28:09.792132+0800 BFLearnIOS[32881:3084736] 当前任务1 ---> <NSThread: 0x600001a0a1c0>{number = 1, name = main}
     2020-07-06 16:28:10.792437+0800 BFLearnIOS[32881:3084736] 当前任务1 ---> <NSThread: 0x600001a0a1c0>{number = 1, name = main}
     2020-07-06 16:28:10.992903+0800 BFLearnIOS[32881:3084736] 当前任务2 ---> <NSThread: 0x600001a0a1c0>{number = 1, name = main}
     2020-07-06 16:28:11.193510+0800 BFLearnIOS[32881:3084736] 当前任务2 ---> <NSThread: 0x600001a0a1c0>{number = 1, name = main}

     */
}

// 测试延迟
- (void)testAsyncAfter {
    NSLog(@"当前线程 ---> %@",[NSThread currentThread]);
    NSLog(@"代码块 开始");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"代码块后");
    });
    for (int i = 0; i < 2; i ++) {
         [NSThread sleepForTimeInterval:2];
        NSLog(@"休眠任务");
    }
    NSLog(@"代码块结束");
    /**
     2020-07-06 16:39:35.346062+0800 BFLearnIOS[33397:3107833] 当前线程 ---> <NSThread: 0x600003db9e00>{number = 1, name = main}
     2020-07-06 16:39:35.346210+0800 BFLearnIOS[33397:3107833] 代码块 开始
     2020-07-06 16:39:37.347358+0800 BFLearnIOS[33397:3107833] 休眠任务
     2020-07-06 16:39:39.348762+0800 BFLearnIOS[33397:3107833] 休眠任务
     2020-07-06 16:39:39.348942+0800 BFLearnIOS[33397:3107833] 代码块结束
     2020-07-06 16:39:39.375552+0800 BFLearnIOS[33397:3107833] 代码块后
     */
    /**
     这个方法并不是立即执行的，延迟执行也不是绝对的准确，他是在延迟时间过后才把任务追加到主队列，如果主队列有其他耗时任务。这个延迟任务也要等待其他任务完成后才能执行
     */
}


// 几个队列执行任务，然后把这些队列都放到一个组 group里，当组里所有队列的任务都完成了之后， group 发出通知，回到主队列完成其他任务
/**
 dispatch_group 可以将 GCD 的任务合并到一个组里来管理，也可以同时监听组里所有任务的执行情况，主要的 API 又一下几个:
 1. dispatch_group_create
 2. dispatch_group_enter
 3. dispatch_group_leave
 4. dispatch_group_wait
 5. dispatch_group_notify
 6. dispatch_group_async
 
 
dispatch_group_enter 和 dispatch_group_leave 实现一组任务完成的监控或回调, 如果只执行 group_enter 不执行 group_leave 则永远不会执行 group_notify

 原理篇:
 
 dispatch_group_create
 
 
 */
- (void)testDispatchGroup {
    NSLog(@"当前队列 ---> %@",[NSThread currentThread]);
    NSLog(@"代码块 ---> 开始");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"执行任务1");
    });
    
    // B 任务
    dispatch_group_enter(group);
    [self sendRequestWithCompletion:^(id response) {
        NSLog(@"执行任务2");
        dispatch_group_leave(group);
    }];
    
    // C 任务
    dispatch_group_enter(group);
    [self sendRequestWithCompletion:^(id response) {
        NSLog(@"执行任务3");
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"执行完了 group");
    });
    NSLog(@"代码块结束");
    /**
     2020-07-06 17:31:22.127398+0800 BFLearnIOS[35289:3187683] 当前队列 ---> <NSThread: 0x6000030cecc0>{number = 1, name = main}
     2020-07-06 17:31:22.127518+0800 BFLearnIOS[35289:3187683] 代码块 ---> 开始
     2020-07-06 17:31:22.127608+0800 BFLearnIOS[35289:3187796] 执行任务1
     2020-07-06 17:31:22.127616+0800 BFLearnIOS[35289:3187683] 代码块结束
     2020-07-06 17:31:24.130460+0800 BFLearnIOS[35289:3187683] 执行任务3
     2020-07-06 17:31:24.130659+0800 BFLearnIOS[35289:3187683] 执行任务2
     2020-07-06 17:31:24.130838+0800 BFLearnIOS[35289:3187683] 执行完了 group
     */
    /**
     dispatch_group_create 其实就是创建一个value 为 LOGN_MAX的 dispatch_semphore 信号量。
     
     */
    
    dispatch_group_t group2 = dispatch_group_create();
    dispatch_group_async(group2, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"group ---- 1 - 1");
    });
    
    dispatch_group_async(group2, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"group ---- 1 - 2");
    });
    
    dispatch_group_async(group2, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"group ---- 1 - 3");
    });
    
    dispatch_group_notify(group2, dispatch_get_main_queue(), ^{
        NSLog(@"group 执行完成");
    });
}

/**
 dispatch_group_enter 和 dispatch_group_leave 实现一组任务完成的监控或回调
 */
- (void)batchRequestConfig {
    dispatch_group_t group = dispatch_group_create();
    NSArray *list = @[@"1",@"2",@"3"];
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(group);
        [self sendRequestWithCompletion:^(id response) {
            NSLog(@"已经完成了");
//            dispatch_group_leave(group);
        }];
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"完成了哦!!!");
    });
    /**
     2020-07-09 11:08:07.221342+0800 BFLearnIOS[1748:66990] 已经完成了
     2020-07-09 11:08:07.221543+0800 BFLearnIOS[1748:66990] 已经完成了
     2020-07-09 11:08:07.221659+0800 BFLearnIOS[1748:66990] 已经完成了
     2020-07-09 11:08:07.221802+0800 BFLearnIOS[1748:66990] 完成了哦!!!
     
     if has no groupLeave. 则永远不会执行 notify
     2020-07-09 11:08:51.086250+0800 BFLearnIOS[1811:68398] 已经完成了
     2020-07-09 11:08:51.086628+0800 BFLearnIOS[1811:68398] 已经完成了
     2020-07-09 11:08:51.086927+0800 BFLearnIOS[1811:68398] 已经完成了
     */
}


- (void)sendRequestWithCompletion:(void (^)(id response))completion {
    //模拟一个网络请求
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(@1111);
        });
    });
}

/**
 dispatch_group 原理:
 
 dispach_group_create:
 */


/**
 信号量:  持有计数的信号，该信号是多线程编程中的技术类型信号，dispatch_Semaphore 中使用了计数来实现该功能，计数为0时等待，计数为1或者大于1时放行。
 信号量的使用比较简单，主要的三个 API: create, wait, signal.
 
 dispatch_semaphore_create 可以用来生成信号量，参数 value 是信号量计数的初始值,
 dispatch_semaphore_wait 会让信号量减一，当信号量为0时会等待(直到超时),否则正常执行
 dispatch_semaphore_signal 会让信号量值加一，如果有通过 dispatch_Semaphpre_wait 函数等待 Dispatch semaphore 的计数值增加的线程，会由系统唤醒最先等待的线程执行。
 */
- (void)testSemaphore {
    
    /**
     信号量常于对于资源进行加锁操作，防止多线程访问修改数据出现结果不一致甚至崩溃的问题。
     */
    
    BFGCDSemaphoreLearn *phoreLearn = [[BFGCDSemaphoreLearn alloc]init];
    [phoreLearn testSemaphore];
}



@end
