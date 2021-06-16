//
//  NSArray+BFSafe.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/8.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "NSArray+BFSafe.h"
#import <objc/runtime.h>

@implementation NSArray (BFSafe)

+(void)load {
    
//    SEL originalSelector = @selector(objectAtIndex:);
//    SEL swizzlingSelector = @selector(fx_objectAtIndex:);
   
//    Method originaMethod = class_getInstanceMethod(object_getClass("__NSArrayI"), originalSelector);
//    Method swiMethod = class_getInstanceMethod(object_getClass("__NSArrayI"),swizzlingSelector);
    
//    BOOL didAddMethod = class_addMethod(self, @selector(objectAtIndex:), method_getImplementation(swiMethod), method_getTypeEncoding(swiMethod));
//    if (didAddMethod) {
//        class_addMethod(self, @selector(fx_objectAtIndex:), method_getImplementation(originaMethod), method_getTypeEncoding(originaMethod));
//    }else {
//        method_exchangeImplementations(originaMethod, swiMethod);
   // }
}

- (void)fx_objectAtIndex:(NSInteger)index {
    if (index > self.count - 1) {
        NSLog(@"objectAtIndex ---- 数组越界");
        return;
    }
    return [self fx_objectAtIndex:index];
}

- (void)fx_objectAtIndexSubscript:(NSInteger)index {
    if (index > self.count - 1) {
        NSLog(@"取下标 --- 数组越界");
        return;
    }
    return [self fx_objectAtIndexSubscript:index];
}

@end
