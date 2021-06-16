//
//  BFTestPerson.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/3/31.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFTestEmployer.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFTestPerson : NSObject

@property(nonatomic, copy) NSString *firstName;
@property(nonatomic, copy) NSString *lastName;

@property(nonatomic, strong) BFTestEmployer *employer;


- (NSString *)fullName;
- (void)setFullName:(NSString *)fullName;

@end

NS_ASSUME_NONNULL_END
