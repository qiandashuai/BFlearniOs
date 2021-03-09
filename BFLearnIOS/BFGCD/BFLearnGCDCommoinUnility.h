//
//  BFLearnGCDCommoinUnility.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/9/21.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFLearnGCDCommoinUnility : NSObject

/**
 dispatch_block_t： 提交给指定队列的 bliock ，无参数无返回值
 */

/**
 判断队列正确姿势与原因,
 
 使用 dispatch_queue_set_specific & dispatch_get_specific 标记并获取指定队列
 使用 dispatch_queue_get_label 获取队列标签，比较字符串判断。
 */
+ (void)performBlockOnMianThread:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END
