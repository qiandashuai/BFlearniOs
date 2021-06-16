//
//  Farther.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/16.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "Farther.h"
#import <objc/runtime.h>
#import "Lender.h"

@implementation Farther

+(instancetype)fartherWithName:(NSString *)name {
    return [[Farther alloc]init];
}

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class aClass = [self class];
//
//        SEL originalSEL = @selector(speak);
//        SEL swizzeSEL = @selector(bf_speak);
//
//        Method originalMethod = class_getInstanceMethod(aClass, originalSEL);
//        Method swizzeMethod = class_getInstanceMethod(aClass, swizzeSEL);
//
//        method_exchangeImplementations(originalMethod, swizzeMethod);
//    });
//}

- (void)speak {
    NSLog(@"this is farther speak ");
}

- (void)bf_speak {
    NSLog(@"this is farther swizzle speak");
}

- (void)updateFarther{
    
}

//+ (BOOL)resolveClassMethod:(SEL)sel {
//    if (sel == @selector(learcClass:)) {
//        class_addMethod(object_getClass(self), sel, class_getMethodImplementation(object_getClass(self), @selector(myClassMethod:)), "v@:");
//        return YES;
//    }
//    return [class_getSuperclass(self) resolveClassMethod:sel];
//}
//
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(goToSchool:)) {
//
//        class_addMethod([self class], sel, class_getMethodImplementation([self class], @selector(myInstaceMethod:)), "v@:");
//    }
//    return  [super resolveInstanceMethod:sel];
//}
//
//+ (void)myClassMethod:(NSString *)string {
//    NSLog(@"myClassMethodName = %@", string);
//}
//
//
//- (void)myInstaceMethod:(NSString *)string {
//    NSLog(@"my instance method = %@", string);
//}
//
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(mysteriousMethod:)) {
//        return [Lender new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
//
//+ (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(testClassMethod:)) {
//        return [Lender class];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
//
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    if ([[Lender new] respondsToSelector:[anInvocation selector]]) {
//        [anInvocation invokeWithTarget:[Lender new]];
//    }
//    [super forwardInvocation:anInvocation];
//}
//
//
//- (NSString *)description {
//    return [NSString stringWithFormat:@"%@:%p",[self class], self];
//}

@end
