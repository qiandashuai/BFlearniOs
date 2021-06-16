//
//  BFDataAnalytics.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/21.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFDataAnalytics.h"
#import "BFAutoTrackUtils.h"
#import "BFDConfigOptions.h"

@implementation BFDataAnalytics


-(instancetype)initWithConfigOptions:(nullable BFDConfigOptions *)configOptions debugMode:(BFSensorsAnalyticsDebugMode)debugMode {
    if (self = [super init]) {
        [self setupListeners];
    }
    return self;
}


- (void)setupListeners {
   
    [self _enableAutoTrack];
}


- (void)_enableAutoTrack {
    
    void (^unswizzleUITableViewAppCLickBlock)(id, SEL, id) = ^(id obj, SEL sel, NSNumber *a) {
        UIViewController *controller = (UIViewController *)obj;
        if (!controller) {
            return;
        }
        
        Class kclass = [controller class];
        
        NSString *screenName = NSStringFromClass(kclass);
        
        // UITableView
        if ([controller respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
            
        }
        
    }
    
}

- (void)trackViewAppClick:(UIView *)view {
    [self trackViewScreen:view properties:nil];
}


//- (void)trackViewAppClic:(UIView *)view withProperties:(NSDictionary *)p {
//    @try {
//        if (view == nil) {
//            return;
//        }
//
//        NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
//      //  [properties addEntriesFromDictionary:<#(nonnull NSDictionary *)#>]
//    } @catch (NSException *exception) {
//
//    } @finally {
//
//    }
//}


- (void)trackViewScreen:(UIViewController *)viewController {
    [self trackViewScreen:viewController properties:nil];
}


- (void)trackViewScreen:(UIViewController *)viewController properties:(NSDictionary<NSString *,id> *)properties {
    [self trackViewScreen:viewController properties:properties autoTrack:NO];
}

- (void)trackViewScreen:(UIViewController *)viewController properties:(NSDictionary<NSString *,id> *)properties autoTrack:(BOOL)autoTrack{
    
    if (!viewController) {
        return;
    }
    
    if ([self isBlackListViewController:viewController ofType:SensorAnalyticsAutoTrackEventTypeViewScreen]) {
        return;;
    }
    
    NSMutableDictionary *eventProperties  = [NSMutableDictionary new];
    
    NSDictionary *autoTrackPropties = [BFAutoTrackUtils proprtiesWithViewController:viewController];
    [eventProperties addEntriesFromDictionary:autoTrackPropties];
    
    
    if (autoTrack) {
        
    }
    
    
    
    
    
}

- (BOOL)isBlackListViewController:(UIViewController *)viewController ofType:(SensorAnalyticsAutoTrackEventType)type{
    static dispatch_once_t onceToken;
    static NSDictionary *allClass = nil;
    
    dispatch_once(&onceToken, ^{
       // get allclass list
        allClass = @{
            
        };
    });
    
    NSDictionary *dictionary = (type == SensorAnalyticsAutoTrackEventTypeViewScreen) ? allClass[SA_EVENT_NAME_APP_VIEW_SCREEN] : allClass[SA_EVENT_NAME_APP_CLICK];
    
    for (NSString *publicClass in dictionary[@"public"]) {
        if ([viewController isKindOfClass:NSClassFromString(publicClass)]) {
            return  YES;
        }
    }
    return NO;
}

@end
