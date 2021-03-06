/**
 * Tencent is pleased to support the open source community by making QMUI_iOS available.
 * Copyright (C) 2016-2020 THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the MIT License (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://opensource.org/licenses/MIT
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
//
//  UITraitCollection+QMUI.m
//  QMUIKit
//
//  Created by ziezheng on 2019/7/19.
//

#import "UITraitCollection+QMUI.h"
#import "QMUICore.h"


@implementation UITraitCollection (QMUI)

static NSHashTable *_eventObservers;
static NSString * const kQMUIUserInterfaceStyleWillChangeSelectorsKey = @"qmui_userInterfaceStyleWillChangeObserver";

+ (void)qmui_addUserInterfaceStyleWillChangeObserver:(id)observer selector:(SEL)aSelector {
    if (@available(iOS 13.0, *)) {
        @synchronized (self) {
            [UITraitCollection _qmui_overrideTraitCollectionMethodIfNeeded];
            if (!_eventObservers) {
                _eventObservers = [NSHashTable weakObjectsHashTable];
            }
            NSMutableSet *selectors = [observer qmui_getBoundObjectForKey:kQMUIUserInterfaceStyleWillChangeSelectorsKey];
            if (!selectors) {
                selectors = [NSMutableSet set];
                [observer qmui_bindObject:selectors forKey:kQMUIUserInterfaceStyleWillChangeSelectorsKey];
            }
            [selectors addObject:NSStringFromSelector(aSelector)];
            [_eventObservers addObject:observer];
        }
    }
}

+ (void)_qmui_notifyUserInterfaceStyleWillChangeEvents:(UITraitCollection *)traitCollection {
    NSHashTable *eventObservers = [_eventObservers copy];
    for (id observer in eventObservers) {
        NSMutableSet *selectors = [observer qmui_getBoundObjectForKey:kQMUIUserInterfaceStyleWillChangeSelectorsKey];
        for (NSString *selectorString in selectors) {
            SEL selector = NSSelectorFromString(selectorString);
            if ([observer respondsToSelector:selector]) {
                NSMethodSignature *methodSignature = [observer methodSignatureForSelector:selector];
                NSUInteger numberOfArguments = [methodSignature numberOfArguments] - 2; // ?????? self cmd ?????????????????????????????????
                NSAssert(numberOfArguments <= 1, @"observer ??? selector ???????????? 1 ???");
                BeginIgnorePerformSelectorLeaksWarning
                if (numberOfArguments == 0) {
                    [observer performSelector:selector];
                } else if (numberOfArguments == 1) {
                    [observer performSelector:selector withObject:traitCollection];
                }
                EndIgnorePerformSelectorLeaksWarning
            }
        }
    }
}

+ (void)_qmui_overrideTraitCollectionMethodIfNeeded {
    if (@available(iOS 13.0, *)) {
        [QMUIHelper executeBlock:^{
            static BOOL _isOverridedMethodProcessing = NO;
            static UIUserInterfaceStyle qmui_lastNotifiedUserInterfaceStyle;
            qmui_lastNotifiedUserInterfaceStyle = [UITraitCollection currentTraitCollection].userInterfaceStyle;
            
            // ?????? -[UIWindow traitCollection] ????????? Main Thread Checker ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? QMUITheme ?????????????????????????????????????????????????????????????????????
            // https://github.com/Tencent/QMUI_iOS/issues/1087
            OverrideImplementation([UIWindow class] , @selector(traitCollection), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
                return ^UITraitCollection *(UIWindow *selfObject) {
                    id (*originSelectorIMP)(id, SEL);
                    originSelectorIMP = (id (*)(id, SEL))originalIMPProvider();
                    UITraitCollection *traitCollection = originSelectorIMP(selfObject, originCMD);
                    
                    if (_isOverridedMethodProcessing || !NSThread.isMainThread) {
                        // +[UITraitCollection currentTraitCollection] ????????? -[UIWindow traitCollection] ?????????????????????????????????
                        return traitCollection;
                    }
                    _isOverridedMethodProcessing = YES;
                    
                    BOOL snapshotFinishedOnBackground = traitCollection.userInterfaceLevel == UIUserInterfaceLevelElevated && UIApplication.sharedApplication.applicationState == UIApplicationStateBackground;
                    // ??????????????????????????????????????????????????? style ??????????????? iOS 13.0 iPad ??????????????????????????????????????????????????? style????????????????????????????????????????????????????????????
                    if (selfObject.windowScene && !snapshotFinishedOnBackground) {
                        NSPointerArray *windows = [[selfObject windowScene] valueForKeyPath:@"_contextBinder._attachedBindables"];
                        // ????????????????????????????????????????????? window ??? traitCollection???????????????????????????????????? window
                        UIWindow *firstValidatedWindow = nil;
                        for (NSUInteger i = 0, count = windows.count; i < count; i++) {
                            UIWindow *window = [windows pointerAtIndex:i];
                            // ?????? Keyboard ???????????? keyboardAppearance ????????? userInterfaceStyle ??? Dark/Light????????????????????????????????????????????????
                            if ([window isKindOfClass:NSClassFromString(@"UIRemoteKeyboardWindow")] || [window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) {
                                continue;
                            }
                            if (window.overrideUserInterfaceStyle != UIUserInterfaceStyleUnspecified) {
                                // ????????????????????????????????????????????? UserInterfaceStyle??????????????? overrideUserInterfaceStyle ???????????????
                                continue;
                            }
                            firstValidatedWindow = window;
                            break;
                        }
                        if (selfObject == firstValidatedWindow) {
                            if (qmui_lastNotifiedUserInterfaceStyle != traitCollection.userInterfaceStyle) {
                                qmui_lastNotifiedUserInterfaceStyle = traitCollection.userInterfaceStyle;
                                [self _qmui_notifyUserInterfaceStyleWillChangeEvents:traitCollection];
                            }
                        } else if (!firstValidatedWindow) {
                            // ?????? firstValidatedWindow ???????????????????????? window ???????????????????????? [UITraitCollection currentTraitCollection] ???????????? becomeFirstResponder ???????????????[UITraitCollection currentTraitCollection] ???????????????????????????
                            static UIWindow *currentTraitCollectionWindow = nil;
                            if (!currentTraitCollectionWindow) {
                                currentTraitCollectionWindow = [[UIWindow alloc] init];
                            }
                            UITraitCollection *currentTraitCollection = [currentTraitCollectionWindow traitCollection];
                            if (qmui_lastNotifiedUserInterfaceStyle != currentTraitCollection.userInterfaceStyle) {
                                qmui_lastNotifiedUserInterfaceStyle = currentTraitCollection.userInterfaceStyle;
                                [self _qmui_notifyUserInterfaceStyleWillChangeEvents:traitCollection];
                            }
                        }
                    }
                    _isOverridedMethodProcessing = NO;
                    return traitCollection;
                    
                };
            });
        } oncePerIdentifier:@"UITraitCollection addUserInterfaceStyleWillChangeObserver"];
    }
}

@end
