//
//  BFSliceImageView.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/19.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFSliceImageView.h"
#import <Masonry/Masonry.h>

@interface BFSliceImageView()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation BFSliceImageView


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit {
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.image = [UIImage imageNamed:@"bg_coupon"];
    [self addSubview:self.imageView];
    [self layoutSubviews];
}


- (void)layoutSubviews {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


@end
