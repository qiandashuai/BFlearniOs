//
//  Lender.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/5/7.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "Lender.h"

@implementation Lender

- (void)mysteriousMethod:(NSString *)string {
    NSLog(@"this is lender %@", string);
}


+(void)testClassMethod:(NSString *)name {
    NSLog(@"this is lender class Name %@",name);
}


- (void)testInvocation {
    NSLog(@"this is lender test invocation");
}
@end
