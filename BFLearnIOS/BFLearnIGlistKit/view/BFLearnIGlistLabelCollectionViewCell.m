//
//  BFLearnIGlistLabelCollectionViewCell.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/27.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFLearnIGlistLabelCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface BFLearnIGlistLabelCollectionViewCell()

@property(nonatomic, strong)UIImageView *imageView;

@end

@implementation BFLearnIGlistLabelCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit {
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.imageView = [UIImageView new];
    [self.contentView addSubview:self.imageView];
    
    self.imageView.image = [UIImage imageNamed:@"testxiaohei"];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

@end
