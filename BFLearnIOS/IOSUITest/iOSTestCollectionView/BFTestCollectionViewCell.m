//
//  BFTestCollectionViewCell.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/4/2.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFTestCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "BFTestCollectionModel.h"
#import <SDWebImage/SDWebImage.h>



@interface BFTestCollectionViewCell()

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *contentLabel;

@end

@implementation BFTestCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}


- (void)layoutSubviews {
}

- (void)commonInit {
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:self.imageView];
    
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.numberOfLines = 2;
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.nameLabel];
    
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.contentLabel.textColor = [UIColor colorWithRed:12/255 green:12/255 blue:12/255 alpha:1];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.contentLabel];
    
    [self setLayoutConstain];
}

- (void)setLayoutConstain {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(200);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.imageView.mas_bottom).mas_offset(10);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.top.equalTo(self.nameLabel.mas_bottom).mas_offset(10);
    }];
}


- (void)prepareForReuse {
    [super prepareForReuse];
    self.imageView.image = nil;
    self.nameLabel.text = nil;
    self.contentLabel.text = nil;
}

- (void)updateWithCollectionModel:(BFTestCollectionModel *)model {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
    self.nameLabel.text = model.name;
    self.contentLabel.text = model.content;
}

@end
