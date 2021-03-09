//
//  BFIGListLearnAdapterDataSource.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/28.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFIGListDiffable.h"

@class BFIGListLearnAdapter;
@class BFIGListLearnSectionController;



NS_ASSUME_NONNULL_BEGIN

@protocol BFIGListLearnAdapterDataSource <NSObject>

// 列表的数据，需要遵循 BFIGListDiffable 协议
- (NSArray<id <BFIGListDiffable>> *)objectsForListAdapter:(BFIGListLearnAdapter *)listAdapter;
- (BFIGListLearnSectionController *)listAdapter:(BFIGListLearnAdapter *)adapter sectionControllerForObject:(id)object;
-(nullable UIView *)emptyViewForListAdapter:(BFIGListLearnAdapter *)listAdapter;

@end

NS_ASSUME_NONNULL_END
