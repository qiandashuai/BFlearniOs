//
//  BFTestPerson.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/3/31.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFTestPerson.h"

@implementation BFTestPerson


- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@_%@", self.firstName, self.lastName];
}

- (void)setFullName:(NSString *)fullName {
    [self hash];
    NSArray *components = [fullName componentsSeparatedByString:@"_"];
    self.firstName = components.firstObject;
    self.lastName = components.lastObject;
}


- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if ([self class] != [object class]) {
        return NO;
    }
    BFTestPerson *person = (BFTestPerson *)object;
    if (![_firstName isEqualToString:person.firstName]) {
        return  NO;
    }
    if (![_lastName isEqualToString:person.lastName]) {
        return NO;
    }
    return YES;
}

- (NSUInteger)hash {
    NSString *stringToHash = [NSString stringWithFormat:@"%@:%@",_firstName,_lastName];
    
    return [stringToHash hash];
}

@end
