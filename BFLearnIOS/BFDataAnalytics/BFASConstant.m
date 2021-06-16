//
//  BFASConstant.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/30.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString * const SA_EVENT_PROPERTY_TITLE = @"title";
static NSString * const SA_EVENT_SCREEN_NAME = @"screen_name";

static NSString * const SA_EVENT_NAME_APP_VIEW_SCREEN = @"$AppViewScreen";
static NSString * const SA_EVENT_NAME_APP_CLICK = @"$AppClick";
static NSString * const SA_EVENT_NAME_APP_START = @"$AppStart";
static NSString * const SA_EVENT_NAME_APP_END = @"$AppEnd";


typedef NS_ENUM(NSInteger, SensorAnalyticsAutoTrackEventType){
    SensorAnalyticsAutoTrackEventTypeNone = 0,
    SensorAnalyticsAutoTrackEventTypeAppStart = 1 << 0,
    SensorAnalyticsAutoTrackEventTypeAppEnd = 1 << 1,
    SensorAnalyticsAutoTrackEventTypeClick = 1 << 2,
    SensorAnalyticsAutoTrackEventTypeViewScreen = 1 << 3
};


typedef NS_ENUM(NSInteger, BFSensorsAnalyticsDebugMode) {
    BFSensorsAnalyticsDebugOff,
    BFSensorsAnalyticsDebugOnly,
    BFSensorsAnalyticsDebugAndTrack
};
