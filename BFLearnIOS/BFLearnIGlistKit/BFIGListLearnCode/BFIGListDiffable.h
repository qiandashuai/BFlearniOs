//
//  BFIGListDiffable.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/28.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BFIGListDiffable <NSObject>

-(nullable id<NSObject>)diffIdentifier;

-(BOOL)isEqualToDiffableObject:(nullable id<BFIGListDiffable>)object;

@end

NS_ASSUME_NONNULL_END
