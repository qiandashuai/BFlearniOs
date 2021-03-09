//
//  BFLearnGCDTestView.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/7/3.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnGCDTestView.h"
#import <Masonry/Masonry.h>


@interface BFLearnGCDTestView()

@end

@implementation BFLearnGCDTestView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self commonInit];
        
    }
    return self;
}

- (void)commonInit {
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.titleLabel.text = @"测试 GCD";
    self.titleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.titleLabel];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self setlayoutSubviews];
}

- (void)setlayoutSubviews {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).mas_offset(100);
    }];
    
}

@end
