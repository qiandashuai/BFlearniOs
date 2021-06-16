//
//  BFBannerPageControl.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/6.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFBannerPageControl.h"
#import "BFLearnAnimatedDotView.h"

static const NSInteger kDefaultNumberOfPages = 0;

static const NSInteger kDefaultCurrentPage  = 0;

static const BOOL kDefaultHideForSinglePage = NO;

static const BOOL kDefaultSpcingBetweenDots = 0;

static const CGSize kDefaultSize = {8,8};

@interface BFBannerPageControl()

@property(nonatomic, strong) NSMutableArray *dots;

@end

@implementation BFBannerPageControl


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


-(void)initialization {
    self.dotViewClass = [BFLearnAnimatedDotView class];
    self.spacingBetweenDots = kDefaultSpcingBetweenDots;
    self.numberOfPages = kDefaultNumberOfPages;
    self.currentPage = kDefaultCurrentPage;
    self.hideForSinglePage = kDefaultHideForSinglePage;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.view != self) {
        NSInteger index=  [self.dots indexOfObject:touch.view];
        if (self.delegate && [self.delegate respondsToSelector:@selector(BFPageControl:didSelectPageAtIndex:)]) {
            [self.delegate BFPageControl:self didSelectPageAtIndex:index];
        }
    }
}


- (void)sizeToFit {
    [self updateFrame:YES];
}

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount {
    return CGSizeMake((self.dotSize.width + self.spacingBetweenDots) * pageCount -  self.spacingBetweenDots, self.dotSize.height);
}

- (void)updateDots {
    if (self.numberOfPages == 0) {
        return;
    }
    
    for (NSInteger i = 0; i < self.numberOfPages; i ++) {
        UIView *dot;
        
        if (i < self.dots.count) {
            dot = [self.dots objectAtIndex:i];
        } else {
            dot = [self generateDotView];
        }
    }
}

- (UIView *)generateDotView {
    return  [UIView new];
}


- (void)updateDotFrame:(UIView *)dot atIndex:(NSUInteger)index{
    
}



- (void)updateFrame:(BOOL)overrideExistingFrame {
    
}

@end
