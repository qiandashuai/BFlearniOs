//
//  BFIGListAdapterUpdateListener.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/29.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BFIGListLearnAdapter;

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, BFIGListAdapterUpdateType) {
    
    // performUpdates
    BFIGListAdapterUpdateTypePerformUpdates,
    
    // reload
    BFIGListAdapterUpdateTypeReloadData,
    
    // performBatch
    BFIGListAdapterUpdateTypeItemUpdates,
};


@protocol BFIGListAdapterUpdateListener <NSObject>


-(void)listAdapater:(BFIGListLearnAdapter *)listAdapter
    didFinishUpdate:(BFIGListAdapterUpdateType)update
           animated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END
