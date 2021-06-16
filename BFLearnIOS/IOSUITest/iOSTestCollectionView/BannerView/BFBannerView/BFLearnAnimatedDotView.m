//
//  BFLearnAnimatedDotView.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/6.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFLearnAnimatedDotView.h"


static const CGFloat kAnimationDuration = 1;

@implementation BFLearnAnimatedDotView


- (instancetype)init {
    if (self = [super init]) {
        [self initialization];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self initialization];
    }
    return self;
}


- (void)setDotColor:(UIColor *)dotColor {
    _dotColor = dotColor;
    self.layer.borderColor = dotColor.CGColor;
}

- (void)initialization {
    _dotColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = CGRectGetWidth(self.frame)/ 2;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
}

- (void)changeActivityState:(BOOL)active {
    if (active) {
        [self animateToActiveState];
    }else {
        [self animatedToDeactiveState];
    }
}

- (void)animateToActiveState {
    [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = self.dotColor;
    } completion:nil];
}

- (void)animatedToDeactiveState {
    [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
