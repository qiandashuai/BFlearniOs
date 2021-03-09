//
//  BFTestModel.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/13.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFTestModel.h"
#import "BFUser.h"

#import <YYModel/YYModel.h>

@interface BFTestModel()

@property(nonatomic, strong) BFUser *userModel;

@end

@implementation BFTestModel


- (void)testUserModel {
    NSDictionary *dict = @{
        @"name":@"zhang",
        @"age": @(22),
        @"childs": @[
                @{
                    @"name":@"wang",
                    @"age":@(23)
                },
                @{
                    @"name":@"zhao",
                    @"age":@(25)
                }
                ],
        @"bfwork": @{
                @"offer":@"alibaba"
        }
    };
    self.userModel = [BFUser yy_modelWithDictionary:dict];
    NSLog(@"user name is %@", self.userModel.name);
}

/**
 {
 "name" :  "zang",
 "age" : 22,
 "childs" : [
   {
 "name" : "zhang",
 "age": 22
 },
 {
 "name" : "wang",
 "age" : 23
 }
 ],
 "bfwork" : {
 "offer" : "alibaba"
 }
 }
 */

@end
