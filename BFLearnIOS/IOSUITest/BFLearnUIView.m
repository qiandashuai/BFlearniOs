//
//  BFLearnUIView.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/5.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnUIView.h"
#import <Masonry/Masonry.h>


@interface BFLearnUIView()

@property(nonatomic, strong) UIView *testView;

@end

@implementation BFLearnUIView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    NSLog(@"BFLearn UI View Layout SubView calling");
}

- (NSInteger)indexOfString:(NSString *)astring {
    
    return NSNotFound;
}

- (void)commonInit {
    self.testView = [[UIView alloc]initWithFrame:CGRectZero];
    self.testView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.testView];
    
    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

@end
