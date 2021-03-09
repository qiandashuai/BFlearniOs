//
//  UIView+Color.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "UIView+Color.h"
#import <objc/runtime.h>


@implementation UIView (Color)

@dynamic defaultColor;

static char KDefaultColorKey;

- (void)setDefaultColor:(UIColor *)defaultColor{
    objc_setAssociatedObject(self, &KDefaultColorKey, defaultColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)defaultColor {
   return objc_getAssociatedObject(self, &KDefaultColorKey);
}

@end
