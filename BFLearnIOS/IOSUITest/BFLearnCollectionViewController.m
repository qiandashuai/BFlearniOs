//
//  BFLearnCollectionViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/30.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnCollectionViewController.h"
#import <YYModel/YYModel.h>
#import "BFTestCollectionModel.h"
#import "BFTestCollectionViewCell.h"


@interface BFLearnCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong)  NSArray<BFTestCollectionModel *> *testModelList;

@end

@implementation BFLearnCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10 ) / 2, 300);
    flowLayout.minimumLineSpacing = 20;
    flowLayout.minimumInteritemSpacing = 10;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[BFTestCollectionViewCell class] forCellWithReuseIdentifier:@"BFTestCollectionViewCell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    [self readJsonFile];
}


- (void)readJsonFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"testCollectionModel" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    self.testModelList = [NSArray yy_modelArrayWithClass:[BFTestCollectionModel class] json:json];
    [self.collectionView reloadData];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.testModelList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BFTestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BFTestCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    [cell updateWithCollectionModel:self.testModelList[indexPath.item]];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"将要惦记了");
}

@end
