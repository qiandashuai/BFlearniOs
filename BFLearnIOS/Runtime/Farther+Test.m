//
//  Farther+Test.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/10/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "Farther+Test.h"
#import <objc/runtime.h>

@implementation Farther (Test)

- (NSString *)fartherBelongName {
    return  objc_getAssociatedObject(self, @"fartherBelong");
}

- (void)setFartherBelongName:(NSString *)name {
    objc_setAssociatedObject(self, @"fartherBelong", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSString *)fartherBelongClass {
    return  objc_getAssociatedObject(self, @"belongClas");
}


- (void)setFartherBelongClass:(NSString *)class {
    objc_setAssociatedObject(self, @"belongClas", class, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
