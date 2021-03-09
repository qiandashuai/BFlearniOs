//
//  BFUser.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFWork.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFUser : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger age;
@property(nonatomic, strong) NSArray<BFUser *> *childs;
@property(nonatomic, assign)  BFWork *bfwork;

@end

NS_ASSUME_NONNULL_END
