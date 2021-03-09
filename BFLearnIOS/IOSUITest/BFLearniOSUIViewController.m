//
//  BFLearniOSUIViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/4/29.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearniOSUIViewController.h"
#import "BFLearniOSEsayUIViewController.h"
#import "BFLearnTableViewViewController.h"
#import "BFLearnCollectionViewController.h"
#import "BFLearnWkWebviewViewController.h"
#import "BFLearnLabelViewController.h"
#import "BFLearnScrollViewController.h"
#import "BFLearnUIBasicTestViewController.h"
#import "BFLearniOSGradientLayerViewController.h"
#import "BFLearnLayoutViewController.h"

@interface BFLearniOSUIViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UITableView *listView;
@property(nonatomic, strong) NSArray<NSString *> *dataList;

@end

@implementation BFLearniOSUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataList = @[@"UITableView",@"UICollectionView",@"WKWebView",@"UILabel",@"UIScrollView",@"GradientLayer",@"SomeBasicTest",@"UILayout"];
    
    [self.view addSubview:self.listView];
}



#pragma mark - UICollectionViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            BFLearnTableViewViewController *easyUI = [[BFLearnTableViewViewController alloc]init];
            [self.navigationController pushViewController:easyUI animated:YES];
        }
            break;
        case 1: {
            BFLearnCollectionViewController *easyUI = [[BFLearnCollectionViewController alloc]init];
            [self.navigationController pushViewController:easyUI animated:YES];
        }
            break;
        case 2:{
            BFLearnWkWebviewViewController *easyUI = [[BFLearnWkWebviewViewController alloc]init];
            [self.navigationController pushViewController:easyUI animated:YES];
        }
            break;
        case 3:
        {
            BFLearnLabelViewController *easyUI = [[BFLearnLabelViewController alloc]init];
            [self.navigationController pushViewController:easyUI animated:YES];
            
        }
            break;
        case 4:
        {
            BFLearnScrollViewController *scrollVC = [[BFLearnScrollViewController alloc] init];
            [self.navigationController pushViewController:scrollVC animated:YES];
        }
            break;
        case 5:
        {
            BFLearniOSGradientLayerViewController *gradientVC = [[BFLearniOSGradientLayerViewController alloc]init];
            [self.navigationController pushViewController:gradientVC animated:YES];
            break;;
        }
        case 6:
        {
            BFLearnUIBasicTestViewController *basicTest = [[BFLearnUIBasicTestViewController alloc]init];
            [self.navigationController pushViewController:basicTest animated:YES];
            break;
        }
        case 7:
        {
            BFLearnLayoutViewController *layoutVC = [[BFLearnLayoutViewController alloc]init];
            [self.navigationController pushViewController:layoutVC animated:YES];
        }break;
            
        default:
            break;
    }
    
}


#pragma mark - UICollectionViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"currentTableCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}





#pragma mark - Getter/Setter


- (UITableView *)listView {
    if (!_listView) {
        _listView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        [_listView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"currentTableCell"];
        _listView.dataSource = self;
        _listView.delegate = self;
    }
    return _listView;
}

@end
