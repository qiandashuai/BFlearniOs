//
//  BFLearnRootViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/5.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnRootViewController.h"
#import "BFLearniOSUIViewController.h"
#import "BFLearnApmViewController.h"
#import "BFLearnMediaViewController.h"
#import "ViewController.h"

@implementation BFLearnRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ViewController *vc1 = [[ViewController alloc]init];
    vc1.tabBarItem.title = @"首页";
    
    
    BFLearnApmViewController *apmVc = [[BFLearnApmViewController alloc]init];
    apmVc.tabBarItem.title = @"APM";
    
    BFLearniOSUIViewController *uiVc = [[BFLearniOSUIViewController alloc]init];
    uiVc.tabBarItem.title = @"UI";
    
    BFLearnMediaViewController *mediaVc = [[BFLearnMediaViewController alloc]init];
    mediaVc.tabBarItem.title = @"多媒体";
    
    self.viewControllers = @[vc1, apmVc, uiVc, mediaVc];
    
}

@end
