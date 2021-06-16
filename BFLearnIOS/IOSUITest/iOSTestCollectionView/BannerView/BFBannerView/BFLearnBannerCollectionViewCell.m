//
//  BFLearnBannerCollectionViewCell.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/6.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFLearnBannerCollectionViewCell.h"
#import <SDWebImage/SDAnimatedImageView.h>

@implementation BFLearnBannerCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
    }
    return self;
}


- (void)setupImageView {
    SDAnimatedImageView *imageView = [[SDAnimatedImageView alloc]initWithFrame:self.contentView.bounds];
    _imageView = imageView;
    [self.contentView addSubview:imageView];
}

@end
