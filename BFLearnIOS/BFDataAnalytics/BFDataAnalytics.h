//
//  BFDataAnalytics.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/21.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFASConstant.m"

NS_ASSUME_NONNULL_BEGIN

@protocol ASAutoTracker <NSObject>

@required
- (NSDictionary *)getTrackProperties;

@end


@protocol SAScreenAutoTrack <NSObject>

@required
-(NSString *)getScreenUrl;


@end

@interface BFDataAnalytics : NSObject


/*
 通过代码触发 UIView 的 $AppClick 事件
 */
- (void)trackViewAppClick:(nonnull UIView *)view;

- (void)trackViewScreen:(UIViewController *)viewController;

- (void)trackViewScreen:(UIViewController *)viewController properties:(nullable NSDictionary<NSString * , id> *)properties;

@end

NS_ASSUME_NONNULL_END
