//
//  BFLearnLabelViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/30.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnLabelViewController.h"
#import <Masonry/Masonry.h>
#import "BFLearnUIView.h"

@interface BFLearnLabelViewController ()

@property(nonatomic, strong) UIView *shadowView;
@property(nonatomic, strong) UIView *shadowView2;
@property(nonatomic, strong) BFLearnUIView *learnUIView;

@end

@implementation BFLearnLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.learnUIView = [[BFLearnUIView alloc]initWithFrame:CGRectMake(100, 100, 150, 100)];
    [self.view addSubview:self.learnUIView];
    
    
    [self createView];
}
/**

 test masonry
 
 学习 autolayout 的相关的一些东西。
 */

- (void)createView {
    self.shadowView = [[UIView alloc]init];
    self.shadowView.layer.cornerRadius = 10;
    
    [self.view addSubview:self.shadowView];
    self.shadowView.backgroundColor = [UIColor redColor];
    
    self.shadowView.layer.shadowPath = (__bridge CGPathRef _Nullable)([UIBezierPath bezierPathWithRoundedRect:self.shadowView.bounds cornerRadius:-5]);
    self.shadowView.layer.shadowColor = [UIColor greenColor].CGColor;
    self.shadowView.layer.shadowRadius = 10;
    self.shadowView.layer.shadowOpacity = 0.4;
    
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}


- (UIView *)shadowView2  {
    if (!_shadowView2) {
        _shadowView2 = [UIView new];
        _shadowView2.backgroundColor = [UIColor yellowColor];
    }
    return _shadowView2;
}

@end
