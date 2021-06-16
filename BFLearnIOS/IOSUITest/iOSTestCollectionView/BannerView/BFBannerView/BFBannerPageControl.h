//
//  BFBannerPageControl.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/6.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BFBannerPageControl;

@protocol BFBannerPageControlDelegate <NSObject>

@optional
- (void)BFPageControl:(BFBannerPageControl *)pageControl didSelectPageAtIndex:(NSInteger)index;

@end


@interface BFBannerPageControl : UIControl

@property(nonatomic, strong) Class dotViewClass;

@property(nonatomic, strong) UIImage *dotImage;

@property(nonatomic, strong) UIImage *currentDorImage;

@property(nonatomic, assign) CGSize dotSize;

@property(nonatomic, strong) UIColor  *dotColor;

@property(nonatomic, strong) UIColor *currentDotColor;

@property(nonatomic, assign) CGFloat spacingBetweenDots;

@property(nonatomic, assign) id <BFBannerPageControlDelegate> delegate;

@property(nonatomic, assign) NSInteger numberOfPages;

@property(nonatomic, assign) NSInteger currentPage;

@property(nonatomic, assign) BOOL hideForSinglePage;

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;

@end

NS_ASSUME_NONNULL_END
