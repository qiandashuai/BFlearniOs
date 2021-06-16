//
//  BFLearnBannerView.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/6.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger ,BFLearnBannerPageControlAligment){
    BFLearnBannerPageControlAligmentCenter,
    BFLearnBannerPageControlAligmentTopRight
};

typedef NS_ENUM(NSUInteger, BFLearnBannerCycleScrollPageControllerStyle) {
    BFLearnBannerCycleScrollPageControllerStyleLong, // rect
    BFLearnBannerCycleScrollPageControllerStyleClassic, // circle dot
    BFLearnBannerCycleScrollPageControllerStyleNone, // 不显示pageControl
};

NS_ASSUME_NONNULL_BEGIN

@class BFLearnBannerView;

@protocol BFLearnBannerViewDelegate <NSObject>

@optional

// 点击图片回调
- (void)cycleScrollView:(BFLearnBannerView *)cycleScroll didSelectItemAtIndex:(NSInteger)index;

// 滚动图片回调
- (void)cycleScrollView:(BFLearnBannerView *)cycleScroll didScrollToIndex:(NSInteger)index;

@end

@interface BFLearnBannerView : UIView

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<BFLearnBannerViewDelegate>)delegate placeholderImage:(UIImage *)placeholderImage;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imageUrlStringsGroup:(NSArray<NSString *> *)imageUrlStringsGroup;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imageNamesGroup:(NSArray <NSString *> *)imageNamesGroup;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame shouldInfiniteLoop:(BOOL)infiniteLoop imageNamesGroup:(NSArray *)imageNamedGroup;

/** 网络图片 url string 数组 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;

/** 每张图片对应要显示的文字数组 */
@property (nonatomic, strong) NSArray *titlesGroup;

/** 本地图片数组 */
@property (nonatomic, strong) NSArray *localizationImageNamesGroup;

//////////////////////////----/滚动控制 API---//////////////////////////////////////////////

@property(nonatomic, assign) CGFloat autoScrollTimeInterval; // 自动滚动时间间隔,默认为两秒

@property(nonatomic, assign) BOOL infiniteLoop; // 是否无限循环

@property(nonatomic, assign) BOOL autoScroll; // 是否自动循环

@property(nonatomic, assign) UICollectionViewScrollDirection scrollDirection; // 图片滚动方向，默认为水平

@property(nonatomic, weak) id<BFLearnBannerViewDelegate> delegate;


- (void)makeScrollViewScrollToIdenx:(NSInteger)index; // 调用此方法手动滚动到哪一个index

- (void)adjustWhenControllerViewWillAppear; // 解决 viewWillAppear 出现时轮播图卡在一半，在 viewWillAppear 时调用此方法


///////////////////---- 自定义样式 API --------------//////////////

@property(nonatomic, assign) UIViewContentMode bannerImageViewContentMode; // 轮播图片的 contentMode, 默认为 UIViewContentModeScaleToFill

@property(nonatomic, strong) UIImage *placeHolderImage; // 占位图，用于网络未加载到图片时

@property(nonatomic, assign) BOOL showPageControl; // 是否显示分页控件

@property(nonatomic, assign) BOOL hidesPageControlForSinge; // 是否在只有一张图片时隐藏 pageControl.默认时 YES

@property(nonatomic, assign) BFLearnBannerPageControlAligment pageControlAligment; // pageControl 的位置

@property(nonatomic, assign) BFLearnBannerCycleScrollPageControllerStyle pageControlStyle; //pageControl 样式

@property(nonatomic, assign) CGFloat pageControlBottomOffset; // pageController 距离底部的间距

@property(nonatomic, assign) CGFloat pageControllerRightOffset; // pageController 距离右边的距离

@property (nonatomic, assign) CGSize pageControlDotSize; // 分页控制小圆标大小

@property (nonatomic, strong) UIColor *currentPageDotColor; // 当前选中 dot 颜色

@property (nonatomic, strong) UIColor *pageDotColor; // 其他分页 dot 颜色

/** 当前分页控件小圆标图片 */
@property (nonatomic, strong) UIImage *currentPageDotImage;

/** 其他分页控件小圆标图片 */
@property (nonatomic, strong) UIImage *pageDotImage;


@end

NS_ASSUME_NONNULL_END
