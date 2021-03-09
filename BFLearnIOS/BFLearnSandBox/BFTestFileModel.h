//
//  BFTestFileModel.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/19.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFTestFileModel : NSObject <NSSecureCoding>

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
