//
//  BFTestEmployer.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/3/31.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  BFTestPerson;

typedef NS_ENUM(NSUInteger, BFEmployerType) {
    BFEmployerTypeDeveloper,
    BFEmployerTypeDesigner,
    BFEmployerTypeFinance
};

NS_ASSUME_NONNULL_BEGIN

@interface BFTestEmployer : NSObject

@property(nonatomic, copy)NSString *name;
@property NSUInteger salary;

+(BFTestEmployer *)employeeWithType:(BFEmployerType)type;

- (void)doADaysWork;

@end

NS_ASSUME_NONNULL_END
