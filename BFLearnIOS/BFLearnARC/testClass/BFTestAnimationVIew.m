//
//  BFTestAnimationVIew.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/3/31.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFTestAnimationVIew.h"


typedef  enum BFPermittedDirection :int BFPermittedDirection;

enum BFPermittedDirection: int {
    BFPermittedDirectionUp = 1 << 0,
    BFPermittedDirectionDown = 1 << 1,
    BFPermittedDirectionLeft = 1 << 2,
    BFPermittedDirectionRight = 1 << 3
};

static const NSTimeInterval kAnimationDuration = 0.3;

enum BFTestEnum {
    BFTestEnumZero,
    BFTestEnumOne,
    BFTestEnumTwo,
    BFTestEnumThree,
    BFTestEnumFour
};



@implementation BFTestAnimationVIew


- (instancetype)initWithColor:(NSInteger)color {
    if (self = [super init]) {
        [self commonInitWithColor:color];
    }
    return self;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
}


- (void)commonInitWithColor:(NSInteger)number {
    
    NSString *foo = @"test string";
    NSString *foo2 = [NSString stringWithFormat:@"test %@",@"string"];
    NSString *foo3 = @"test string";
    
    if (foo == foo2) {
        NSLog(@"foo == foo2");
    } else {
        NSLog(@"foo != foo2");
    }
    
    if ([foo isEqualToString:foo2]) {
        NSLog(@"foo is equal to foo2");
    } else {
        NSLog(@"foo is not equal to foo2");
    }
    
    
    
//    enum BFTestEnum testrnum = BFTestEnumTwo;
//    switch (number) {
//        case BFTestEnumZero:
//            NSLog(@"this is color zero");
//            break;
//        case BFTestEnumOne:
//            NSLog(@"this is color one");
//            break;
//        case BFTestEnumTwo:
//            NSLog(@"this is color two");
//            break;
//        case BFTestEnumThree:
//            NSLog(@"this is color three");
//            break;
//        case BFTestEnumFour:
//            NSLog(@"this is color four");
//            break;
//        default:
//            NSLog(@"this is color defalut");
//            break;
//    }
}


- (void)animate {
    [UIView animateWithDuration:kAnimationDuration animations:^{
        NSLog(@"this is over");
    }];
}

@end
