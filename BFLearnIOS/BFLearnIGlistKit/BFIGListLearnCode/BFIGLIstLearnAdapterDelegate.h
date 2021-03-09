//
//  BFIGLIstLearnAdapterDelegate.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/28.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BFIGListLearnAdapter;

NS_ASSUME_NONNULL_BEGIN

@protocol BFIGLIstLearnAdapterDelegate <NSObject>


/*
@param listAdapter The list adapter sending this information.
@param object The object that will display.
@param index The index of the object in the list.
*/

-(void)listAdapter:(BFIGListLearnAdapter *)listAdapter willDisplayObject:(id)object atIndex:(NSInteger)index;

-(void)listAdapter:(BFIGListLearnAdapter *)listAdapter didEndDisplayingObject:(id)object atIndex:(NSInteger)index;



@end

NS_ASSUME_NONNULL_END
