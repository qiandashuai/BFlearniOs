//
//  BFIGlistModel.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/27.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFIGlistModel.h"

@implementation BFIGlistModel

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}
- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object{
    return YES;
}

@end
