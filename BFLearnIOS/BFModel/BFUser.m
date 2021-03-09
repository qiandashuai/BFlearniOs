//
//  BFUser.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFUser.h"

@implementation BFUser

+(NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"childs" : [BFUser class]
    };
}

@end
