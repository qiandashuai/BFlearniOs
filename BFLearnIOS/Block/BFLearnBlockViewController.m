//
//  BFLearnBlockViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/7/10.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnBlockViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>

@interface BFLearnBlockViewController ()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation BFLearnBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(self.view);
    }];
    
    self.imageView.image = [UIImage imageNamed:@"block_impl"];
}

/**
 block 一个函数指针+该函数执行的外部的上下文变量，
 block:
 可以嵌套定义，
 定义在a方法内部，
 本质是对象，是代码高度聚合
 */

@end
