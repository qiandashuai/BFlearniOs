//
//  BFLearniOSEsayUIViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/19.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearniOSEsayUIViewController.h"
#import "BFSliceImageView.h"
#import <Masonry/Masonry.h>

@interface BFLearniOSEsayUIViewController ()

@end

@implementation BFLearniOSEsayUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self testSlicingImageView];
}

      

- (void)testSlicingImageView {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    BFSliceImageView *imageView = [[BFSliceImageView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(600);
        make.width.mas_equalTo(width/2);
    }];
    
}


@end
