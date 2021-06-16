//
//  BFAutoTrackUtils.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/30.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFAutoTrackViewControllerProperty.h"
#import "BFASConstant.m"
#import "BFDataAnalytics.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFAutoTrackUtils : NSObject

@end

@interface BFAutoTrackUtils(Property)

/**
 采集 ViewController 中的事件属性
 
 @param viewController 需要采集的 viewController
 @return 事件中与 viewController 相关的属性字典
 */

+ (NSMutableDictionary<NSString *, NSString *> *)proprtiesWithViewController:(UIViewController<BFAutoTrackViewControllerProperty> *)viewController;

@end

NS_ASSUME_NONNULL_END
