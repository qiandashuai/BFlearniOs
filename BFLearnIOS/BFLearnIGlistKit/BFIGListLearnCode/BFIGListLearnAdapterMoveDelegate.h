//
//  BFIGListLearnAdapterMoveDelegate.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/28.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BFIGListLearnAdapter;

NS_ASSUME_NONNULL_BEGIN

@protocol BFIGListLearnAdapterMoveDelegate <NSObject>

//  Asks the delegate to move a section object as the result of interactive reordering.
//
- (void)listAdapter:(BFIGListLearnAdapter *)listAdapter
         moveObject:(id)object
               from:(NSArray *)previousObjects
                 to:(NSArray *)objects;

@end

NS_ASSUME_NONNULL_END
