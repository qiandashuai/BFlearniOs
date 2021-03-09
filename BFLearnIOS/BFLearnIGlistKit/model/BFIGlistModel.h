//
//  BFIGlistModel.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/27.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFIGlistModel : NSObject<IGListDiffable>

@property(nonatomic, strong)id realModel;


@end

NS_ASSUME_NONNULL_END
