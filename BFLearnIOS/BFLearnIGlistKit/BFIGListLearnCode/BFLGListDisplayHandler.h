//
//  BFLGListDisplayHandler.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/29.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BFIGListLearnSectionController;
@class BFIGListLearnAdapter;

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface BFLGListDisplayHandler : NSObject

// counted set of the currently visible section controller
@property(nonatomic, strong, readonly) NSCountedSet<BFIGListLearnSectionController *> *visibleListSections;


/**
 Tells the handler that a cell will displayed in  the BFIGListLearnAdapter
 
 @param cell A Cell that will be display
 @param listAdapter the adapter the cell will displaty in
 @param sectionController The section controller that managers the cell
 @param object The object that pwoers the section controller
 @param indexPath the index path of the cell in the uicollection view
 */
-(void)willDisplayCell:(UICollectionViewCell *)cell
        forListAdapter:(BFIGListLearnAdapter *)listAdapter
     sectionController:(BFIGListLearnSectionController *)sectionController
                object:(id)object
            indexPatah:(NSIndexPath *)indexPath;




@end

NS_ASSUME_NONNULL_END
