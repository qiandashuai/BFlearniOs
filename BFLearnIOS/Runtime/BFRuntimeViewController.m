//
//  BFRuntimeViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/30.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFRuntimeViewController.h"
#import "Farther+Test.h"
#import <objc/runtime.h>
#import "Lender.h"
#import "Son.h"
#import <objc/message.h>

//
//typedef IMP *IMPPointer;
//static void MethodSwizzle(id self, SEL _cmd, id arg1);
//static void (* MethodOriginal)(id self, SEL _cmd, id arg1);
//
//static void MethodSwizzle(id self, SEL _cmd, id arg1) {
//    MethodOriginal(self, _cmd, arg1);
//}
//
//BOOL class_swizzleMethodAndStore(Class class, SEL original, IMP replacement, IMPPointer store) {
//    IMP imp = NULL;
//    Method method = class_getInstanceMethod(class, original);
//    if (method) {
//        const char *type = method_getTypeEncoding(method);
//        imp = class_replaceMethod(class, original, replacement, type);
//        if (!imp) {
//            imp = method_getImplementation(method);
//        }
//    }
//    if (imp && store) {
//        *store = imp;
//    }
//    return  (imp != NULL);
//}



@interface BFRuntimeViewController ()

@end

@implementation BFRuntimeViewController


//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class aClass = [self class];
//        SEL originalSelector = @selector(viewWillAppear:);
//        SEL swizzlingSelector = @selector(bfViewWillApprear:);
//        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
//        Method swizzlingMethod = class_getInstanceMethod(aClass, swizzlingSelector);
//        BOOL didAddMethod = class_addMethod(aClass, originalSelector, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
//        if (didAddMethod) {
//            class_replaceMethod(aClass, swizzlingSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzlingMethod);
//        }
//
//    });
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}



- (void)bfViewWillApprear:(BOOL)animation {
    [self bfViewWillApprear:animation];
    NSLog(@"view Will Appear %@", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Son *son = [[Son alloc]init];
    [son speak];
    
    
    Farther *farther = [[Farther alloc]init];
    [farther speak];
    
//
//    NSMethodSignature *selector1 = [self methodSignatureForSelector:@selector(greetingWithName:)];
//
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:selector1];
//    [invocation setSelector:@selector(greetingWithName:)];
//
//    NSUInteger age = 10;
//    NSString *name = @"test";
//    [invocation setArgument:&name atIndex:2];
//    [invocation invokeWithTarget:self];
//
//
//
//    Farther *farther = [[Farther alloc] init];
//    farther.fartherBelongName = @"AIA";
//    farther.fartherBelongClass = @"TOP";
//
//    NSLog(@"%@",farther.fartherBelongClass);
//    NSLog(@"%@",farther.fartherBelongName);
//
//    id FartherClass = object_getClass(@"Farther");
//    unsigned int outCount;
//    objc_property_t *properties = class_copyPropertyList(FartherClass, &outCount);
//    for (int i = 0; i < outCount; i ++) {
//        objc_property_t property = properties[i];
//        fprintf(stdout,"%s %s\n", property_getName(property), property_getAttributes(property));
//    }
}

//
//- (void)greetingWithName:(NSString *)name {
//    NSLog(@"Hello World %@", name);
//}
//
//- (void)greetingWithAge:(NSUInteger)age name:(NSString *)name {
//    NSLog(@"Hello %@  %ld",name,(long)age);
//}

@end
