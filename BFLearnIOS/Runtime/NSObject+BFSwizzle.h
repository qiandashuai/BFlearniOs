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

+ (BOOL)bf_swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel error:(NSError **)error;
- (BOOL)bf_swizzleInstnceMethod:(SEL)origSel withMethod:(SEL)altSel error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
