//
//  BFLearnIGListKitViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/27.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFLearnIGListKitViewController.h"
#import <IGListKit/IGListAdapter.h>
#import <IGListKit/IGListKit.h>
#import "BFLearnLabelSectionController.h"
#import "BFIGlistModel.h"

@interface BFLearnIGListKitViewController ()<IGListAdapterDataSource, IGListAdapterDelegate, IGListAdapterMoveDelegate>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) IGListAdapter *adapter;

@end

@implementation BFLearnIGListKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    
    self.adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.adapter.delegate = self;
    self.adapter.moveDelegate  = self;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return @[@"test",@"22"];
}


- (void)listAdapter:(IGListAdapter *)listAdapter willDisplayObject:(id)object atIndex:(NSInteger)index {
    NSLog(@"test will display");
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingObject:(id)object atIndex:(NSInteger)index {
    NSLog(@"test will end display");
}


- (void)listAdapter:(IGListAdapter *)listAdapter moveObject:(id)object from:(NSArray *)previousObjects to:(NSArray *)objects {
    NSLog(@"test move object");
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object;{
    BFLearnLabelSectionController *sectionC = [[BFLearnLabelSectionController alloc]init];
    return sectionC;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"bg_coupon"];
    return imageView;
}

@end
