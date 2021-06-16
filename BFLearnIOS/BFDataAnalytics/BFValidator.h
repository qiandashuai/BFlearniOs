//
//  BFValidator.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/31.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFValidator : NSObject


+ (BOOL) isValidString:(NSString *)string;

+ (BOOL)isValidDictionary:(NSDictionary *)dictionary;

+ (BOOL)isValidArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
