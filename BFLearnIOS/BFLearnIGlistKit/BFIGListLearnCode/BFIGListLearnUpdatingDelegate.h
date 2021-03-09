//
//  BFIGListLearnUpdatingDelegate.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/28.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BFIGListDiffable;

NS_ASSUME_NONNULL_BEGIN

typedef void (^BFIGlistUpdatingCompletion)(BOOL finished);

typedef void (^BFIGlistTransitionBlock)(NSArray *toObjects);

typedef void (^BFIGlistItemUpdateBlock)(void);

typedef void (^BFIGlistReloadBlock)(void);

typedef NSArray * _Nullable (^BFIGlistToObjectBlock)(void);


@protocol BFIGListLearnUpdatingDelegate <NSObject>

//
- (NSPointerFunctions *)objectLookupPointFunction;


- (void)performUpdateWithCollectionView:(UICollectionView *)collectionView
                            fromObjects:(nullable NSArray<id <BFIGListDiffable>> *)fromObject
                         toObjectsBlock:(nullable BFIGlistToObjectBlock)toObjectsBlock
                               animated:(BOOL)animated
                  objectTransitionBlock:(BFIGlistTransitionBlock)objectTransitionBlock
                             completion:(nullable BFIGlistUpdatingCompletion)completion;

// tell the delegate to perform inserts at the given index paths
- (void)insertItemsIntoCollectionView:(UICollectionView *)colelctionView indexPaths:(NSArray <NSIndexPath *> *)indexsPaths;


// tells the delegate to perform item delete at the given indexPath
- (void)deleteItemsFromCollectoionView:(UICollectionView *)collectionView indexsPaths:(NSArray <NSIndexPath *> *)indexsPaths;




@end

NS_ASSUME_NONNULL_END
