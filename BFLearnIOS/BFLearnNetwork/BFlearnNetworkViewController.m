//
//  BFlearnNetworkViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFlearnNetworkViewController.h"

@interface BFlearnNetworkViewController ()<NSURLSessionDelegate, NSURLSessionDataDelegate>

@property(nonatomic, strong)  NSURLSessionDataTask *task ;

@end

@implementation BFlearnNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    
    self.task = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.task resume];
    [session finishTasksAndInvalidate];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"这是什么呢哈哈");
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didFinishCollectingMetrics:(NSURLSessionTaskMetrics *)metrics {
    NSLog(@"这是什么呢");
}

@end
