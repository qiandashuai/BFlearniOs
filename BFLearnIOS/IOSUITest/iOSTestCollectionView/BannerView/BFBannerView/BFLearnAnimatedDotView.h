//
//  BFLearnAnimatedDotView.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/6.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFLearnAnimatedDotView : UIView

@property(nonatomic, strong) UIColor *dotColor;

- (void)changeActivityState:(BOOL)active;

@end

NS_ASSUME_NONNULL_END
