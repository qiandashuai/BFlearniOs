//
//  BFLearnLayoutViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/7/22.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnLayoutViewController.h"
#import "BFLearnLayoutTableViewCell.h"

@interface BFLearnLayoutViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray<NSString *> *tableModelList;

@end

/**
NSLayoutConstraint
以及学习 autolayout 的实现逻辑
 */

@implementation BFLearnLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"界面布局";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self commonInit];
}


- (void)commonInit {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[BFLearnLayoutTableViewCell class] forCellReuseIdentifier:NSStringFromClass([BFLearnLayoutTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 600;
    self.tableView.rowHeight= UITableViewAutomaticDimension;
    [self.view addSubview:self.tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BFLearnLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BFLearnLayoutTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}



@end
