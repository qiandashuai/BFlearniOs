//
//  BFLearnLayoutTableViewCell.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/27.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFLearnLayoutTableViewCell.h"
#import <Masonry/Masonry.h>

@interface BFLearnLayoutTableViewCell()

@property(nonatomic, strong)UILabel *contentLabel;
@property(nonatomic, strong)UIImageView *testIamegView;

@end

@implementation BFLearnLayoutTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:self.contentLabel];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.text = @"When you set the row height as UITableViewAutomaticDimension, the table view is told to use the Auto Layout constraints and the contents of its cells to determine each cell’s height.";
    
    self.testIamegView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:self.testIamegView];
    self.testIamegView.image = [UIImage imageNamed:@"testxiaohei"];
    
    [self setLayoutConstrains];
}

-(void)setLayoutConstrains {
    
    
    [self.testIamegView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.contentView);
        make.width.mas_equalTo(200);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.testIamegView.mas_bottom);
    }];
}

@end
