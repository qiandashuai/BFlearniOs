//
//  BFIGListLearnAdapter.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/28.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFIGListLearnAdapterDataSource.h"
#import "BFIGLIstLearnAdapterDelegate.h"
#import "BFIGListLearnAdapterMoveDelegate.h"
#import "BFIGListLearnUpdatingDelegate.h"
#import "BFIGListAdapterUpdateListener.h"

NS_ASSUME_NONNULL_BEGIN


typedef void (^BFIGListUpdaterCompletion)(BOOL finish);

@interface BFIGListLearnAdapter : NSObject

@property(nonatomic, nullable, weak) UIViewController *viewController;

@property(nonatomic, nullable, weak) UICollectionView *collectionView;

@property(nonatomic, nullable, weak) id<BFIGListLearnAdapterDataSource> dataSource;

@property(nonatomic, nullable, weak) id<BFIGLIstLearnAdapterDelegate> delegate;

@property(nonatomic, nullable, weak) id<UICollectionViewDelegate> collectionViewDelegate;

@property(nonatomic, nullable, weak) id<UIScrollViewDelegate> scrollViewDelegate;

@property(nonatomic, nullable, weak) id<BFIGListLearnAdapterMoveDelegate> moveDelegate NS_AVAILABLE_IOS(9.0);

- (instancetype)initWithUpdater:(id <BFIGListLearnUpdatingDelegate>)updater
                 viewController:(nullable UIViewController *)viewController
                   workingRange:(NSInteger)workingRangeSize NS_DESIGNATED_INITIALIZER;

-(instancetype)initWithUpdater:(id<BFIGListLearnUpdatingDelegate>)updater
                viewController:(UIViewController *)viewController;

-(void)performUpdatesAnimated:(BOOL)animated completion:(nullable BFIGListUpdaterCompletion)completion;

- (void)reloadDataWithCompletion:(nullable BFIGListUpdaterCompletion)completion;

- (void)reloadObjects:(NSArray *)objects;




@end

NS_ASSUME_NONNULL_END
