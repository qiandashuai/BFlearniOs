//
//  BFIGListCollectionContext.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/29.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BFIGListLearnSectionController;

NS_ASSUME_NONNULL_BEGIN

// the collection context provides limited access to the collection-related information that section controllers needs for opertions like sizing, dequeing cells,
// deleting reload, reloading otc....

@protocol BFIGListCollectionContext <NSObject>

@property(nonatomic, readonly) CGSize containerSize;

@property(nonatomic, readonly) UIEdgeInsets cotainerInsets;

@property(nonatomic, readonly) UIEdgeInsets adjustContainerInset;

@property(nonatomic, readonly) CGSize insetContainerSize;

- (CGSize)containerSizeForSectionController:(BFIGListLearnSectionController *)sectionController;

- (NSInteger)indexForCell:(UICollectionViewCell *)cell
        sectionController:(BFIGListLearnSectionController *)sectionController;


@end


NS_ASSUME_NONNULL_END
