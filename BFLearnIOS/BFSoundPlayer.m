//
//  BFSoundPlayer.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/6/1.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFSoundPlayer.h"

@implementation BFSoundPlayer {
    NSMutableArray *_elements;
    NSLock *_lock;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _elements = [NSMutableArray array];
        _lock = [[NSLock alloc]init];
    }
    
    return self;
}

- (void)push:(id)element {
    [_lock lock];
    [_elements addObject:element];
    [_lock unlock];
}
@end
