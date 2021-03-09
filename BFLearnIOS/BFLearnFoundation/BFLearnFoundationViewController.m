//
//  BFLearnFoundationViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/7/28.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnFoundationViewController.h"

@interface BFLearnFoundationViewController ()

@end

@implementation BFLearnFoundationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    NSMutableArray *array = [@[@"宝贝宝贝",@"长势什么都好iu啊好堵啊",@"我的宝啊喝点酒啊好堵啊好堵啊",@"等哈u好堵啊动画化",@"不得回家啊不得丷把戈德哈根不好的",@"不对丷不到丷不到丷不到哈"] mutableCopy];
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",@"宝"];
    
  NSArray *result =   [array filteredArrayUsingPredicate:bPredicate];
    NSLog(@"%@",result);
    
}

// 筛选和排序

// 谓语编程指南



@end
