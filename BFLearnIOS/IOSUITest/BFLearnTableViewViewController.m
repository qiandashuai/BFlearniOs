//
//  BFLearnTableViewViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/30.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnTableViewViewController.h"
#import <Masonry/Masonry.h>
#import "UITableViewCell+CellShadows.h"

@interface BFLearnTableViewViewController ()<UITableViewDataSource, UITableViewDelegate>


//@property(nonatomic, strong) UISearchBar *searchBar;

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation BFLearnTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"uitableviewcellclass"];
    [self.view addSubview:self.tableView];
    
//    self.searchBar = [UISearchBar new];
//    _searchBar.clipsToBounds = NO;
//    _searchBar.layer.cornerRadius = 8;
//    //_searchBar.barStyle = UIBarStyleDefault;
//    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
//
//    UITextField *textField = (UITextField *)[_searchBar valueForKey:@"searchTextField"];
//    textField.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.searchBar];
//
//    textField.backgroundColor = [UIColor whiteColor];
//
//    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.centerY.equalTo(self.view.mas_centerY);
//        make.size.mas_equalTo(CGSizeMake(300, 40));
//    }];
    // Do any additional setup after loading the view.
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"uitableviewcellclass" forIndexPath:indexPath];
    cell.textLabel.text = @"测试测试";
    [cell addShadowToCellInTableView:tableView atIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
