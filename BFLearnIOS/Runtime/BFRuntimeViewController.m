//
//  BFRuntimeViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/30.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFRuntimeViewController.h"
#import "Farther+Test.h"
#import <objc/runtime.h>

@interface BFRuntimeViewController ()

@end

@implementation BFRuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Farther *farther = [[Farther alloc] init];
    farther.fartherBelongName = @"AIA";
    farther.fartherBelongClass = @"TOP";
    
    NSLog(@"%@",farther.fartherBelongClass);
    NSLog(@"%@",farther.fartherBelongName);
    
    id FartherClass = object_getClass(@"Farther");
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList(FartherClass, &outCount);
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        fprintf(stdout,"%s %s\n", property_getName(property), property_getAttributes(property));
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
