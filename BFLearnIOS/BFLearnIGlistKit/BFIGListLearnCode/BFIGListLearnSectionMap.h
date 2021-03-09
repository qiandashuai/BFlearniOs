//
//  BFIGListLearnSectionMap.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/29.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFIGListLearnSectionMap : NSObject <NSCopying>


// BFIGListLearnSectionMap is a mutable object and not guarantee thread safety.// 不保证线程安全
// provide a way to map a collection of obejcts to a collection of section controller and achieve
- (instancetype)initWithMapTable:(NSMapTable *)mapTbale NS_DESIGNATED_INITIALIZER;





@end

NS_ASSUME_NONNULL_END
