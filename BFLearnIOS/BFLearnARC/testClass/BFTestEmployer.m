//
//  BFTestEmployer.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/3/31.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFTestEmployer.h"

static const NSTimeInterval kAnimationDuration = 0.3;

@interface BFTestEmployerDeveloper : BFTestEmployer

@end

@implementation BFTestEmployerDeveloper

- (void)doADaysWork {
    NSLog(@"this is BFTestEmployerDeveloper");
}


@end


@interface BFTestEmployerDesigner : BFTestEmployer

@end

@implementation BFTestEmployerDesigner

- (void)doADaysWork {
    NSLog(@"this is BFTestEmployerDesigner");
}


@end

@interface BFTestEmployerFinance : BFTestEmployer

@end

@implementation BFTestEmployerFinance

- (void)doADaysWork {
    NSLog(@"this is BFTestEmployerFinance");
}

@end

@implementation BFTestEmployer

+(BFTestEmployer *)employeeWithType:(BFEmployerType)type {
    switch (type) {
        case BFEmployerTypeDeveloper:
            return [BFTestEmployerDeveloper new];
            break;
        case BFEmployerTypeDesigner:
            return [BFTestEmployerDesigner new];
            break;
        case BFEmployerTypeFinance:
            return [BFTestEmployerFinance new];
            break;
    }
}

- (void)doADaysWork {
    NSLog(@"this is BFTestEmployer");
}

@end
