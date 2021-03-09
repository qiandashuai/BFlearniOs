//
//  BFTestRuntime.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/10.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFTestRuntime.h"
#import <objc/message.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "BFTest2Runtime.h"

@interface BFTestRuntime()


@end

@implementation BFTestRuntime
//
//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class cls = [self class];
//        SEL originSelector = @selector(originMethod:);
//        SEL swizzledSelector = @selector(targetMethod:);
//
//        Method originalMethod = class_getClassMethod(cls, originSelector);
//        Method swizzledMethod = class_getClassMethod(cls, swizzledSelector);
//
//        BOOL didAddMethod = class_addMethod(cls, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//        if (didAddMethod) {
//            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//    });
//}


- (void)originMethod:(NSString *)originString {
    NSLog(@"origin string is %@",originString);
}


- (void)targetMethod:(NSString *)targetString {
     NSLog(@"origin string is %@",targetString);
}

- (void)testNSObject {
    
    UILabel *label1 = [UILabel new];
    NSUInteger label1Hash = [label1 hash];
    NSLog(@"label1 hash is  %ld",label1Hash);
    NSString *superClassName = NSStringFromClass([[NSObject new] superclass]);
    NSLog(@"superclass name is %@", superClassName);
}


- (void)bftestNSObject {
    NSLog(@"this is change function");
}


- (void)testDynamicFuntionReslove {
    [self performSelector:@selector(foo)];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;
//    if (sel == @selector(foo:)) {
//        class_addMethod([self class], sel, method_getImplementation(class_getInstanceMethod(self, @selector(newFooMethod))), @"v@:okok");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}


// Type Encodings

// 为了帮助runtime system. 编译器将会 encodes 每一个方法的参数和返回值


-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqual:@"foo"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}


- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL sel = anInvocation.selector;
    
    
    // 获取某个类的实例方法签名
    //A record of the type information for the return value and parameters of a method.
    // 设置参数和返回值
    NSMethodSignature *singature =[self methodSignatureForSelector:sel];
    
  // An NSInvocation object contains all the elements of an Objective-C message: a target, a selector, arguments, and the return value. Each of these elements can be set directly, and the return value is set automatically when the NSInvocation object is dispatched.
    // An Objective-C message rendered as an object.
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:singature];
    
    // 设置
    [invocation setTarget:self];
    
    // 设置要执行的 selector
    [invocation setSelector:@selector(newFooMethod)];
    
    [invocation setArgument:@"okok" atIndex:1];
    
    [invocation invoke];
    
    
    
    
    BFTest2Runtime *bftest = [BFTest2Runtime new];
    if ([bftest respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:bftest];
    } else{
        [self doesNotRecognizeSelector:sel];
    }
}

- (void)newFooMethod {
    NSLog(@"Doing Foo");
}

@end
