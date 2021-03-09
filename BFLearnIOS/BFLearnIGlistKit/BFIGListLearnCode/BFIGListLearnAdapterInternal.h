//
//  BFIGListLearnAdapterInternal.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/29.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFIGListLearnAdapter.h"
#import "BFIGListLearnSectionMap.h"

NS_ASSUME_NONNULL_BEGIN

// 内联函数，编译的时候就将其放在各处，每个地方都有一个函数
NS_INLINE NSString *BGIGListReuseableTableViewIndentifier(Class viewClass, NSString * _Nullable nibName, NSString * _Nullable kind, NSString * _Nullable givenReuseIndentifier) {
    return [NSString stringWithFormat:@"%@%@%@%@", kind ?: @"", nibName ?: @"", givenReuseIndentifier ?: @"", NSStringFromClass(viewClass)];
}


@interface BFIGListLearnAdapter()
{
    __weak UICollectionView *_collectionView;
    BOOL _isDequeuingCell;
    BOOL _isSendingWorkingRangeDisplayUpdates;
}

@property(nonatomic, strong) id<BFIGListLearnUpdatingDelegate> updater;
//@property(nonatomic, strong, readonly) 
@property(nonatomic, strong, readonly) BFIGListLearnSectionMap *sectionMap;



@end

@interface BFIGListLearnAdapterInternal : NSObject


@end

NS_ASSUME_NONNULL_END
