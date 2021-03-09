//
//  Son.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/16.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "Son.h"

@implementation Son


- (instancetype)init{
    if (self = [super init]) {
        NSLog(@"%@", NSStringFromClass([self class]));
         NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}


- (void)speak {
    NSLog(@"this is son speak");
}

@end
