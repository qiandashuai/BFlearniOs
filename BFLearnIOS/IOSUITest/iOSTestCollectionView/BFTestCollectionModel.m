//
//  BFTestCollectionModel.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/2.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFTestCollectionModel.h"

@implementation BFTestCollectionModel


+(NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"imageUrl":@"imgPath"
    };
}

@end
