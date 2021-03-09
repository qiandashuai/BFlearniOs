//
//  AppDelegate.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/2.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SideMenu-Swift.h"
#import "BFLearnRootViewController.h"
#import "BFLearnIOS-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions  {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:[BFLearnRootViewController new]];
    
//    SideMenuManager *sideManager = [SideMenuManager default];
//    sideManager.menuLeftNavigationController = rootNav;
//
//    sideManager.menuRightNavigationController = [[UISideMenuNavigationController alloc]initWithRootViewController:[BFLeftSideMenuViewController new]];
//
//
    
    
    self.window.rootViewController = rootNav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    return false;
}



@end
