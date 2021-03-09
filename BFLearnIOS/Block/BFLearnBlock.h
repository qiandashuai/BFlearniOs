//
//  BFLearnBlock.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/23.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^clickBlock)(NSInteger index);

typedef void(^handleBlock)(void);

@interface BFLearnBlock : NSObject

@property(nonatomic, copy) clickBlock imageClickBlock;
@property(nonatomic, copy) void(^returnBlock)(NSString *returnName);

- (void)testBlock;

- (void)testHandleBlock:(handleBlock)handleBlock;

-(void)testRetuenBloackName:(void(^)(NSString *returnName))returnName;

@end

NS_ASSUME_NONNULL_END
