//
//  Son.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/16.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "Son.h"
#import <objc/runtime.h>

@implementation Son

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        
        SEL originSel = @selector(speak);
        SEL swizzleSel = @selector(bf_speak);
        
        Method originMethod = class_getInstanceMethod(aClass, originSel);
        Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
        
        // 如果类中没有实现 Original Selector 对应的方法，那就先添加 Method ，并将其 IMP 映射为 Swizzle 的实现，然后替换 Swizzle Selector 的 IMP 为 original 的实现，否则交换二者 IMP
        BOOL didAddMethod = class_addMethod(aClass, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
        if (didAddMethod) {
            class_replaceMethod(aClass, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else  {
            method_exchangeImplementations(originMethod, swizzleMethod);
        }
    });
}


- (instancetype)init{
    if (self = [super init]) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}

//- (void)bf_speak {
//    NSLog(@"this is son swizzle speak");
//}

//- (void)speak {
//    NSLog(@"this is son speak");
//}

@end
