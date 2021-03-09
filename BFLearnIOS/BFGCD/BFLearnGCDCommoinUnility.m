//
//  BFLearnGCDCommoinUnility.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/9/21.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnGCDCommoinUnility.h"

@implementation BFLearnGCDCommoinUnility

+ (void)performBlockOnMianThread:(dispatch_block_t)block {
    if (NSThread.currentThread.isMainThread) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

@end
