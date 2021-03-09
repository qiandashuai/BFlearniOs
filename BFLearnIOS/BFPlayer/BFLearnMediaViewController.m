//
//  BFLearnMediaViewController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/6/20.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import "BFLearnMediaViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface BFLearnMediaViewController ()

@property(nonatomic, strong) AVPlayer *player;
@property(nonatomic, strong) AVPlayerLayer *playerLayer;
@property(nonatomic, strong) AVPlayerItem *playerItem;
@property(nonatomic, strong) UIView *videoView;


// AVKit

// AVAsset ---- 资源属性
// AVPlayerItem ---- 播放属性
// AVPlayer
// AVPlayerLayper

// delegate 一对一
// KVO 一对多，有依赖
// notification 一对多，无依赖，中心化管理
// CMTime
//需要注意 CMTime 的相关操作逻辑


@end

@implementation BFLearnMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)playerVideo {
}


@end
