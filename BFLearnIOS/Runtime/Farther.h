//
//  Farther.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/16.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Farther : NSObject


+ (void)learcClass:(NSString *)string;
- (void)mysteriousMethod:(NSString *)name;
+ (void)testClassMethod:(NSString *)methodStest;
- (void)testInvocation;

@property(nonatomic, strong) NSString *name;
- (void)speak;

+ (instancetype)fartherWithName:(NSString *)name;
- (void)updateFarther;

@end

NS_ASSUME_NONNULL_END
