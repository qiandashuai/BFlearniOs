//
//  NSObject+BFModel.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/2.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "BFModelMeta.h"

NS_ASSUME_NONNULL_BEGIN


@protocol BFModel <NSObject>

@optional
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass;

@end


@interface NSObject (BFModel)


@end

NS_ASSUME_NONNULL_END
