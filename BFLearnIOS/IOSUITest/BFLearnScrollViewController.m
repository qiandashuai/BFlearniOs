//
//  BFLearnScrollViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/6.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnScrollViewController.h"

@interface BFLearnScrollViewController () <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;

@end

@implementation BFLearnScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height);
    self.scrollView.contentOffset = CGPointMake(self.view.bounds.size.width,0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.scrollView];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"current content offset --- %f", scrollView.contentOffset.x);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"start scroll");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate) {
        NSLog(@"end descele");
    } else {
        NSLog(@"end ****");
    }
}


@end
