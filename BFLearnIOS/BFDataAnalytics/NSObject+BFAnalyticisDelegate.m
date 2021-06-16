//
//  NSObject+BFAnalyticisDelegate.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/6/16.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "NSObject+BFAnalyticisDelegate.h"
#import <objc/runtime.h>
#import <objc/message.h>


static void sa_tableViewDidSelectRowAtIndexPath(id self, SEL _cmd, id tableView, id indexPath) {
    SEL selector = NSSelectorFromString(@"sa_tableView:didSelectorRowAtIndexPath:");
    ((void(*)(id, SEL, id, id))objc_msgSend)(self, selector, tableView, indexPath);
}

static void sa_collectionViewDidSelectItemAtIndexPath(id self, SEL _cmd, id collectionView, id indexPath) {
    SEL selector = NSSelectorFromString(@"sa_collectionView:didSelectItemAtIndexPath:");
    ((void(*)(id, SEL, id, id))objc_msgSend)(self, selector, collectionView, indexPath);
}


static void bf_setDelegate(id obj, SEL sel, id delegate) {
    SEL swizzleSel = sel_getUid("bf_setDelegate:"); // 获取方法名
    ((void (*)(id, SEL, id))objc_msgSend)(obj, swizzleSel, delegate);
    if (delegate == nil) {
        return;
    }
    
    if ([obj isKindOfClass:[UITableView class]]) {
        if ([delegate isKindOfClass:[UITableView class]]) {
            return;
        }
        
        Class class = [delegate class];
        
        // 一直找到最后的父类实现了点击
        do {
            
            Method rootMethod = nil;
            if ((rootMethod = class_getInstanceMethod(class, @selector(tableView:didSelectRowAtIndexPath:)))) {
                if (!class_getInstanceMethod(class_getSuperclass(class), @selector(tableView:didSelectRowAtIndexPath:))) {
                    SEL swizSel = NSSelectorFromString(@"sa_tableView:didSelectorRowAtIndexPath:");
                    SEL oriSel = @selector(tableView:didSelectRowAtIndexPath:);
                    if (class_addMethod(class, swizSel, (IMP)sa_tableViewDidSelectRowAtIndexPath, method_getTypeEncoding(rootMethod))) {
                        Method oriMethod = class_getInstanceMethod(class, oriSel);
                        Method swizMethod = class_getInstanceMethod(class, swizSel);
                        method_exchangeImplementations(oriMethod, swizMethod);
                    }
                }
                break;
            }
            
        } while ((class = class_getSuperclass(class)));
    } else if ([obj isKindOfClass:[UICollectionView class]]) {
        if ([delegate isKindOfClass: [UICollectionView class]]) {
            return;
        }
        Class class = [delegate class];
        
        do {
            Method *rootMethod = nil;
            if ((rootMethod = class_getInstanceMethod(class, @selector(collectionView:didSelectItemAtIndexPath:)))) {
                if (!class_getInstanceMethod(class_getSuperclass(class), @selector(collectionView:didSelectItemAtIndexPath:))) {
                    SEL swizeSel = NSSelectorFromString(@"sa_collectionView:didSelectItemAtIndexPath:");
                    SEL originSel = NSSelectorFromString(@"collectionView:didSelectItemAtIndexPath:");
                    
                    Method oriMethod = class_getInstanceMethod(class, originSel);
                    
                    if (class_addMethod(class, swizeSel, (IMP)sa_collectionViewDidSelectItemAtIndexPath, method_getTypeEncoding(oriMethod))) {
                        Method swizMethod = class_getInstanceMethod(class, swizeSel);
                        method_exchangeImplementations(swizMethod, oriMethod);
                    }
                }
                break;
            }
            
        } while ((class = class_getSuperclass(class)));
    }
    
    
}

@implementation NSObject (BFAnalyticisDelegate)

@end


@implementation UITableView (BFAnalyticisDelegate)

+ (void)load {
    NSLog(@"现在要替换方法啦!!!!");
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        SEL originSel = sel_getUid("setDelegate:");
        SEL swizSel = sel_getUid("bf_setDelegate:");
        
        Method originMethod = class_getInstanceMethod([self class], originSel);
        class_addMethod(self, swizSel, (IMP)bf_setDelegate, method_getTypeEncoding(originMethod));
        Method swizMethod = class_getInstanceMethod(self, swizSel);
        
        
//        method_setImplementation(originMethod, method_getImplementation(swizMethod));
//        method_setImplementation(swizMethod, method_getImplementation(originMethod));
        method_exchangeImplementations(originMethod, swizMethod);
        
    });
}


@end

@implementation UICollectionView (BFAnalyticisDelegate)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originSel = sel_getUid("setDelegate:");
        SEL swizSel = sel_getUid("bf_setDelegate:");
        
        Method originMethod = class_getInstanceMethod(self, originSel);
        class_addMethod(self, swizSel, (IMP)bf_setDelegate, method_getTypeEncoding(originMethod));
        
        Method swizzMethod = class_getInstanceMethod(self, swizSel);
        
        method_exchangeImplementations(originMethod, swizzMethod);
        
        
    });
}

@end
