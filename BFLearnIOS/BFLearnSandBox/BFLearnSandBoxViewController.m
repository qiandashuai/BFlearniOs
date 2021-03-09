//
//  BFLearnSandBoxViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/19.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnSandBoxViewController.h"

@interface BFLearnSandBoxViewController ()

@end

@implementation BFLearnSandBoxViewController

/**
 SandBox
 NSFileManager
 NSFileHandler
 
 本文主要了解iOS 沙盒， NSFileManager NSFIleHandler
 // NSCoder  将对象   >-----> 二进制流 相互转换
 
---   NSUserDefault: 提供 Key-Value 存储
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSString *cacheDataPath = [cachePath stringByAppendingPathComponent:@"myCache"];
    
    
    
    NSFileManager *fileManager =  [NSFileManager defaultManager];
    NSData *content = [@"adadad" dataUsingEncoding:NSUTF8StringEncoding];
    
    [fileManager createDirectoryAtPath:cachePath withIntermediateDirectories:NO attributes:nil error:nil];
    
    [content writeToFile:cacheDataPath options:NSDataWritingAtomic error:nil];
    
    
    NSFileHandle *fileHandler = [NSFileHandle  fileHandleForWritingAtPath:cacheDataPath];
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:[@"efefe" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandler synchronizeFile];
    [fileHandler closeFile];

    
    
//    NSFileHandle *fileHandler = [NSFileHandle a];
    // Do any additional setup after loading the view.
    
    
}


@end
