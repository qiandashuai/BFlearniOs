//
//  BFLearnCacheViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/8/12.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnCacheViewController.h"
#import <YYCache/YYCache.h>

@interface BFLearnCacheViewController ()

@property(nonatomic, strong) UIImageView *cacheImageView;
@property(nonatomic, strong) UITextView *textView;

@end

@implementation BFLearnCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**
     __unsafe_unretained 
     */
    
    
    self.cacheImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    
    [self testCache];
    
    /**
     本文主要用于学习 YYCache
     
        - yycahe:  提供了最外层的接口，调用了相关 YYMemoryCache 与 YYDiskCache 的相关方法
        - YYMemoryCache: 负责处理容量小，相对高速的内存缓存，线程安全，支持自动和手动清理缓存等功能
        - _YYLinkedMap: 双向链表类
        - _YYLinkedMapNode: 链表的节点类
        YYDiskCache: 负责处理容量大，相对低速的磁盘缓存，线程安全，支持异步操作，自动和手动处理缓存等功能
        YYKVStorage: YYDiskCache 的底层实现类，用于管理磁盘缓存
        YYKVStorageItem: 内置在 YYKVStorage 中，是YYKVStorage 内部用于封装某个缓存的类
     
     */
}


- (void)testCache {
    YYCache *cache = [[YYCache alloc]initWithName:@"name1"];
    YYCache *cache2 = [[YYCache alloc]initWithName:@"name2"];
    YYCache *cache3 = [[YYCache alloc]initWithName:@"name3"];
    YYCache *cahe4 = [[YYCache alloc]initWithName:@"name4"];
}


@end
