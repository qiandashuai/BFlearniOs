//
//  BFAutoTrackViewControllerProperty.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/30.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BFAutoTrackViewControllerProperty <NSObject>

@property(nonatomic, assign) BOOL sensordata_isIgnored;
@property(nonatomic, copy, readonly) NSString *sensorsdata_screenName;
@property(nonatomic, copy, readonly) NSString *sensordata_title;

@end

NS_ASSUME_NONNULL_END
