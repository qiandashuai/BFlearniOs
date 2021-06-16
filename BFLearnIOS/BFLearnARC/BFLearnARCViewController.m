//
//  BFLearnARCViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/12.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnARCViewController.h"
#import "BFTestAnimationVIew.h"
#import "BFTestPerson.h"

@interface BFLearnARCViewController ()

@property(nonatomic, strong) NSArray *array1;
@property(nonatomic, copy) NSArray *array2;
@property(nonatomic, copy) NSMutableArray *array3;
@property(nonatomic, strong) NSMutableArray *array4;

@end

@implementation BFLearnARCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//
//    BFTestAnimationVIew *animation =  [[BFTestAnimationVIew alloc]init];
//    [animation commonInitWithColor:2];
//
//    BFTestPerson *person = [[BFTestPerson alloc]init];
//    [person setFullName:@"zzzz_zzzz"];
    
    
    [self testVectorSet];
    // Do any additional setup after loading the view.
}

- (void)testVectorSet {
    NSMutableSet *set = [NSMutableSet new];
    
    NSMutableArray *arrayA = [@[@1,@2] mutableCopy];
    [set addObject:arrayA];
    NSLog(@"set = %@", set);
    
//    NSMutableArray *arrayB = [@[@1,@2] mutableCopy];
//    [set addObject:arrayB];
//    NSLog(@"set = %@", set);
    
    NSMutableArray *arrayC = [@[@1] mutableCopy];
    [set addObject:arrayC];
    NSLog(@"set = %@", set);
    [arrayC addObject:@2];
    NSLog(@"set = %@", set);
}

@end
