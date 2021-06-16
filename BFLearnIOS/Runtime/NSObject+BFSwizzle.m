//
//  NSObject+BFSwizzle.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/10/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "NSObject+BFSwizzle.h"
#import <objc/runtime.h>
#import <objc/message.h>


#define GetClass(obj) object_getClass(obj)

@implementation NSObject (BFSwizzle)

//
//+ (BOOL)bf_swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel error:(NSError *__autoreleasing  _Nullable *)error {
//    if (!origSel || !altSel) {
//        return NO;
//    }
//   Method orignalMethod = class_getClassMethod(self, origSel);
//
//}


//+ (BOOL)bf_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel_ error:(NSError *__autoreleasing  _Nullable *)error {
//
//    Method originMethod = class_getInstanceMethod(self, origSel);
//    if (!originMethod) {
//        return  NO;
//    }
//
//    Method altMethod = class_getInstanceMethod(self, altSel_);
//    if (!altMethod) {
//        return NO;
//    }
//
//    class_addMethod(self, origSel, class_getMethodImplementation(self, origSel), method_getTypeEncoding(originMethod));
//    class_addMethod(self, altSel_, class_getMethodImplementation(self, altSel_), method_getTypeEncoding(altMethod));
//
//    method_exchangeImplementations(class_getInstanceMethod(self, origSel), class_getInstanceMethod(self, altSel_));
//
//    return YES;
//}
//
//+(BOOL)bf_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError *__autoreleasing  _Nullable *)error_ {
//
//    return  [GetClass((id)self) bf_swizzleMethod:origSel_ withMethod:altSel_ error:error_];
//}


@end
