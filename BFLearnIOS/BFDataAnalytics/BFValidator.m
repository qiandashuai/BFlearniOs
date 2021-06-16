//
//  BFValidator.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/31.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFValidator.h"

@implementation BFValidator


+ (BOOL)isValidString:(NSString *)string {
    return ([string isKindOfClass:[NSString class]] && [string length] > 0);
}

+ (BOOL)isValidArray:(NSArray *)array {
    return ([array isKindOfClass:[NSArray class]] && [array count] > 0);
}

+ (BOOL)isValidDictionary:(NSDictionary *)dictionary {
    return ([dictionary isKindOfClass:[NSDictionary class]] && [dictionary count] > 0);
}

@end
