//
//  BFAutoTrackUtils.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/30.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFAutoTrackUtils.h"
#import "BFValidator.h"

@implementation BFAutoTrackUtils

@end


@implementation BFAutoTrackUtils(Property)

+ (NSMutableDictionary<NSString *,NSString *> *)proprtiesWithViewController:(UIViewController<BFAutoTrackViewControllerProperty> *)viewController {
    
    NSMutableDictionary *property = [[NSMutableDictionary alloc]init];
    property[SA_EVENT_SCREEN_NAME] = viewController.sensorsdata_screenName;
    property[SA_EVENT_PROPERTY_TITLE] = viewController.sensordata_title;
    
    
    if ([viewController conformsToProtocol:@protocol(ASAutoTracker)] && [viewController respondsToSelector:@selector(getTrackProperties)]) {
        NSDictionary *trackProperties = [(UIViewController<ASAutoTracker> *)viewController getTrackProperties];
        if ([BFValidator isValidDictionary:trackProperties]) {
            [property addEntriesFromDictionary:trackProperties];
        }
    }
    
    return property;
}

@end
