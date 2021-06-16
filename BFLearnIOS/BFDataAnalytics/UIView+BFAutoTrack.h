//
//  UIView+BFAutoTrack.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/6/16.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BFAutoTrackViewControllerProperty <NSObject>

@property(nonatomic, readonly) BOOL sensordata_isIgnored;
@property(nonatomic, copy, readonly) NSString *sensordata_screenName;
@property(nonatomic, copy, readonly) NSString *sensordata_title;

@end

@protocol BFAutoTrackViewProperty <NSObject>

@property(nonatomic, readonly) BOOL sensorsdata_ignored;
// 记录上次触发点击事件的开机时间
@property(nonatomic, assign) NSTimeInterval sensordata_timeIntervalForLastAppClick;
@property(nonatomic, copy, readonly) NSString *sensordata_elementType;
@property(nonatomic, copy, readonly) NSString *sensordata_elementContent;
@property(nonatomic, copy, readonly) NSString *sensordata_elementId;

// 元素位置，UISegmentedControl 返回 index
@property(nonatomic, copy, readonly) NSString *sensordata_elementPosition;
@property(nonatomic, readonly) UIViewController *sensordata_viewController;

@end

@interface UIView (BFAutoTrack) <BFAutoTrackViewProperty>

@end

@interface UIButton (BFAutoTrack) <BFAutoTrackViewProperty>

@end

NS_ASSUME_NONNULL_END
