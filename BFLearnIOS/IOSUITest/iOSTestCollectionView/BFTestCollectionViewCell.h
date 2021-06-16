//
//  BFTestCollectionViewCell.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/2.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BFTestCollectionModel;

@interface BFTestCollectionViewCell : UICollectionViewCell

- (void)updateWithCollectionModel:(BFTestCollectionModel *)model;

@end

NS_ASSUME_NONNULL_END
