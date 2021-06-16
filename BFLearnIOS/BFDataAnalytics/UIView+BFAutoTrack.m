//
//  UIView+BFAutoTrack.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/6/16.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "UIView+BFAutoTrack.h"

@implementation UIView (BFAutoTrack)

@end

@implementation UIButton (BFAutoTrack)

- (NSString *)sensordata_elementContent {
    NSString *text = self.titleLabel.text;
    if (!text) {
        text = super.sensordata_elementContent;
    }
    return  text;
}

@end
