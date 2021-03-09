//
//  BFIGListLearnAdapter.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/28.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFIGListLearnAdapter.h"


@implementation BFIGListLearnAdapter
{
    NSMapTable <UICollectionReusableView *, BFIGListLearnSectionController *> *_viewSectionControllerMap;
    NSMutableArray<void (^)(void)> *_queuedCompletionBlocks;
    NSHashTable<id<BFIGListAdapterUpdateListener>> *_updateListeners;
}

#pragma mark - Init

- (instancetype)initWithUpdater:(id<BFIGListLearnUpdatingDelegate>)updater viewController:(UIViewController *)viewController workingRange:(NSInteger)workingRangeSize {
    NSAssert([NSThread isMainThread] == YES, @"Must be on the main thread");
    NSAssert(updater, @"updater can not be nil");
    
    if (self = [super init]) {
        NSPointerFunctions *keyFunctions = [updater objectLookupPointFunction];
        NSPointerFunctions *valueFuncations = [NSPointerFunctions pointerFunctionsWithOptions:NSPointerFunctionsStrongMemory];
        NSMapTable *table = [[NSMapTable alloc]initWithKeyPointerFunctions:keyFunctions valuePointerFunctions:valueFuncations capacity:0];
        
    }
    return  nil;
}

@end
