//
//  NSObject+BFSwizzle.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/10/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BFSwizzle)

// NSError

+ (BOOL)bf_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel_ error:(NSError **)error;
+ (BOOL)bf_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError **)error_;

@end

NS_ASSUME_NONNULL_END
