//
//  BFlearnNetworkViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFlearnNetworkViewController.h"

@interface BFlearnNetworkViewController ()

@end

@implementation BFlearnNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"192.168.0.10:8900"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    
    [dataTask resume];
    
}


@end
