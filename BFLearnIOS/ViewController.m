//
//  ViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/2.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "ViewController.h"
#import "BFLearniOSUIViewController.h"
#import "BFLearnMediaViewController.h"
#import "BFLearnGCDViewController.h"
#import "BFLearnRunLoopViewController.h"
#import "BFRuntimeViewController.h"
#import "BFLearnBlockViewController.h"
#import "BFLearnApmViewController.h"
#import "BFLearnDebugHackViewController.h"
#import "BFLearnLaunchViewController.h"
#import "BFLearnFoundationViewController.h"
#import "BFLearnCacheViewController.h"
#import "BFLearnARCViewController.h"
#import "BFlearnNetworkViewController.h"
#import "BFLearnSandBoxViewController.h"
#import <objc/runtime.h>
#import "BFLearnIGListKitViewController.h"
#import <Aspects/Aspects.h>
#import "BFLearnIOS-Swift.h"
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
#import "Farther.h"
#import "NSArray+BFSafe.h"
#import "Son.h"



static void qh_viewDidLoad(UIViewController *kvo_self, SEL _sel) {
    Class kvo_cls = object_getClass(kvo_self);
    Class origin_cls = class_getSuperclass(kvo_cls);
    
    // 注意点
    
    IMP origin_imp = method_getImplementation(class_getInstanceMethod(origin_cls, _sel));
    
    void (*func)(UIViewController *, SEL) = (void(*)(UIViewController *, SEL))origin_imp;
    
    CFAbsoluteTime startTime = CACurrentMediaTime();
    
    func(kvo_self,_sel);
    
    CFAbsoluteTime endTime = CACurrentMediaTime();
    NSTimeInterval duration = (endTime - startTime) * 1000;
    
    NSLog(@"Class %@ cost %g in viewDidLoad", [kvo_self class], duration);
    
}


@interface testFarther : NSObject

@end

@implementation testFarther


@end

@interface testSon : testFarther

@end

@implementation testSon


@end

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource, UITableViewDataSourcePrefetching>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray<NSString *> *LearnList;
@property(nonatomic, strong) NSProgress *overallProgress;

@end



__weak id reference = nil;

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    qh_viewDidLoad(self, @selector(viewDidLoad));
    self.LearnList = @[@"UI进阶",@"GCD进阶",@"RunLoop",@"Runtime",@"BLOCK详解",@"性能监控",@"Debug Hacks",@"启动流程",@"基础Foundaion",@"缓存",@"内存管理",@"网络请求",@"文件操作",@"IGListKit",@"testSwift"];
    [self.view addSubview:self.tableView];
//    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
//    BOOL res2 = [(id)[NSObject class] isMemberOfClass:object_getClass([NSObject class])];
//    BOOL res3 = [(id)[Farther class] isMemberOfClass:[Farther class]];
//    BOOL res4 = [(id)[Farther class] isKindOfClass:[Farther class]];
//    BOOL res5 = [(id)[Son class] isKindOfClass:object_getClass([Farther class])];
//    BOOL res6 = [(id)[Son class] isMemberOfClass:[Farther class]];
//
//    NSLog(@"%d ---- %d --- %d --- %d --- %d --- %d", res1, res2, res3, res4, res5, res6);
    
    /**
     2021-06-02 15:20:14.927512+0800 BFLearnIOS[8464:267967] 1 ---- 1 --- 0 --- 0 --- 1 --- 0
     */
    
    
    
//    Farther *farther = [Farther new];
//
//    Class currentClass = [Farther class];
//    Class currentClass2 = object_getClass([Farther class]);
//    Class currentClass3 = objc_getClass("Farther");
//    BOOL res1 = class_isMetaClass(currentClass);
//    BOOL res2 = class_isMetaClass(currentClass2);
//    BOOL res3 = class_isMetaClass(currentClass3);
//    NSLog(@"%p", currentClass);
//    NSLog(@"%p", currentClass2);
//    NSLog(@"%p", currentClass3);
    //
//    NSLog(@"%d ---- %d --- %d --- %d", res1, res2, res3, res4);
//
//    [NSThread detachNewThreadSelector:@selector(testThread) toTarget:self withObject:nil];
//
//    NSThread *mythread = [[NSThread alloc]initWithTarget:self selector:@selector(testThread2) object:nil];
//    [mythread start];
//    NSLog(@"test送emthing");
    
    /**
     NSThread 执行完之后会立即退出,  此时在调用会crash
     *** -[ViewController performSelector:onThread:withObject:waitUntilDone:modes:]: target thread exited while waiting for the perform
     如果需要用就需要保活
     */
   // [self performSelector:@selector(testThread) onThread:mythread withObject:nil waitUntilDone:YES];
    
//    NSLog(@"这是妇儿保健阿巴斯的");

    /**
     viewDidLoad
     2021-06-02 14:53:52.889257+0800 BFLearnIOS[7698:243524] 0x106dc2268
     2021-06-02 14:53:52.889448+0800 BFLearnIOS[7698:243524] 0x106dc2290
     2021-06-02 14:53:52.889536+0800 BFLearnIOS[7698:243524] 0x106dc2268
     2021-06-02 14:53:52.889606+0800 BFLearnIOS[7698:243524] 0 ---- 1 --- 0
     */
    
//    NSLog(@"%p", currentClass3);
    
//
//    for ( int i = 0; i < 4; i ++) {
//        NSLog(@"")
//    }
//
//
    
//    BOOL res1 = [farther isKindOfClass:[Farther class]];
//    BOOL res2 = [farther isMemberOfClass:[Farther class]];
//
//    object_getClass(farther);
//
//    NSLog(@"%d ---- %d", res1, res2);
    
    
    
//    NSArray *testList = @[@"a",@"b",@"c",@"d"];
//
//    NSLog(@"object = %@", farther);
////
////    [testList objectAtIndex:2];
//
//    NSMutableDictionary *testDict = [@{
//        @"test1":@"这是1",
//    } mutableCopy];
//
//    NSLog(@"%@",testDict);
//
//    NSDictionary *testDict2 = @{
//        @"test2":@"这是2",
//        @"test3":@"这是3",
//        @"test4":@"这是4"
//    };
//
//    NSLog(@"%@",testDict2);
//
//    [testDict addEntriesFromDictionary:testDict2];
//    NSLog(@"%@",testDict);
//
//
//    NSLog(@"%d  %d  %d  %d", res1, res2, res3, res4);
   // [self startTaskWithData:[NSData new]];
//    [self testSomeApi];
//    [self testAspect];
    
//    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
//    [detector addCandidate:self];
//    NSSet *retainCycles = [detector findRetainCycles];
//    NSLog(@"%@", retainCycles);
    
  //  [self testGcd];
}

//+ (BOOL)bfisKindOfClass:(Class)cls {
//    for (Class tls = object_getClass((id)self); tls; tls= tls->superclass) {
//        if (cls == tls) {
//            return  YES;
//        }
//    }
//    return  NO;
//}
//
//
//+ (BOOL)bfisMemberOfClass:(Class)cls {
//    return cls == object_getClass((id)self);
//}
//
//
//- (BOOL)bfisKindOfClass:(Class)cls {
//    for (class tls = [self Class]; tls; tls = tls -> superclass) {
//        if ( tls == cls) {
//            return  YES;
//        }
//    }
//    return  NO;
//}
//
//
//- (BOOL)bfisMemberOfClass:(Class)clks {
//    return  clks == [self class];
//}
//





//- (void)testGcd {
//    NSArray *arrayTest = [[NSArray alloc]init];
//    @try {
//        NSLog(@"Object: %@", [arrayTest objectAtIndex:0]);
//    } @catch (NSException *exception) {
//        NSLog(@"NSException caught");
//        NSLog(@"Name %@", exception.name);
//        NSLog(@"Reason: %@", exception.reason);
//    } @finally {
//        NSLog(@"这是什么情况");
//    }
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@",reference);
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@", reference);
}


- (void)testThread {
    NSLog(@"opkok");
}

- (void)testThread2 {
    NSLog(@"opkokdad222");
}

- (void)testSomeApi {
//    NSPointerArray *pointArray = [NSPointerArray alloc]initWithOptions:nspointfunctionop
 //   [self testSet];
    [self aspect_hookSelector:@selector(testAspect) withOptions:0 usingBlock:^(void){
        NSLog(@"this is aspect output");
    } error:nil];
}


- (void)testAspect {
    NSLog(@"this is content output");
}


- (void)testArray {
    NSArray *testList = @[@"first", @"second",@"third",@"fifth",@"fourth",@"six",@"seven"];
    NSLog(@"%@",testList);
    NSArray *sortArray = [testList sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSLog(@"%@",sortArray);
    
    NSIndexSet *indexs = [sortArray indexesOfObjectsWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        return YES;
    }];
    
    NSLog(@"%@",indexs);
}


- (void)testSet {
    NSMutableSet *set1 = [NSMutableSet setWithObjects:@(1),@(2),@(3),@(4),@(5), nil];
    NSMutableSet *set2 = [NSMutableSet setWithObjects:@(4),@(5),@(6),@(7),@(8), nil];
    NSLog(@"%@",set1);
    NSLog(@"%@",set2);
}


- (void)sortArray {
    
}

- (void)startTaskWithData:(NSData *)data {
    NSUInteger batchSize = 20;
    NSProgress *progress = [NSProgress progressWithTotalUnitCount:batchSize];
    
    [progress setCompletedUnitCount:2];
    [progress setCancellationHandler:^{
        NSLog(@"progress current cancel");
    }];
    for (NSUInteger index = 0; index < batchSize; index ++) {
        if ([progress isCancelled]) {
            NSLog(@"progree is canceed --- %ld",index);
        }
        
        if (index == 10) {
            [progress cancel];
        }
        
        NSLog(@"current is %ld", index);
        [progress setCompletedUnitCount:(index + 1)];
    }
}

- (void)startLongOperation {
    self.overallProgress = [NSProgress progressWithTotalUnitCount:100];
    
    [self.overallProgress becomeCurrentWithPendingUnitCount:50];
    [self work1];
    [self.overallProgress resignCurrent];
}


- (void)work1 {
    NSProgress *firstProgress = [NSProgress progressWithTotalUnitCount:10];
}


- (void)work2 {
    NSProgress *secondProgress = [NSProgress progressWithTotalUnitCount:10];
}


#pragma mark - UItableViewDatasource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.LearnList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.LearnList[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            BFLearniOSUIViewController *vc = [[BFLearniOSUIViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            BFLearnGCDViewController *vc = [[BFLearnGCDViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            BFLearnRunLoopViewController *vc = [[BFLearnRunLoopViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3: {
            BFRuntimeViewController *vc = [[BFRuntimeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4: {
            BFLearnBlockViewController *vc = [[BFLearnBlockViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5: {
            BFLearnApmViewController *vc = [[BFLearnApmViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case 6: {
            BFLearnDebugHackViewController *vc = [[BFLearnDebugHackViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case 7: {
            BFLearnLaunchViewController *vc = [[BFLearnLaunchViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case 8: {
            BFLearnFoundationViewController *vc = [[BFLearnFoundationViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 9: {
            BFLearnCacheViewController *vc = [[BFLearnCacheViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case 10: {
            BFLearnARCViewController *vc = [[ BFLearnARCViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case 11: {
            BFlearnNetworkViewController *vc = [[BFlearnNetworkViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case 12: {
            BFLearnSandBoxViewController *vc = [[BFLearnSandBoxViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 13: {
            BFLearnIGListKitViewController *vc = [[BFLearnIGListKitViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case 14: {
            BFTestSwiftViewController *vc = [[BFTestSwiftViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
  
}


#pragma mark - Getter/Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.prefetchDataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

@end
