//
//  BFLearnUIBasicTestViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/4.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFLearnUIBasicTestViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>

@interface BFLearnUIBasicTestViewController ()

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UIView *testView;
 
@end

@implementation BFLearnUIBasicTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.testView];
    
}

- (UIImageView *)iamgeView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _imageView;
}


- (UIView *)testView {
    if (!_testView) {
        _testView = [[UIView alloc]initWithFrame:CGRectZero];
        _testView.backgroundColor = [UIColor redColor];
    }
    return _testView;
}

@end
