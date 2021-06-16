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

@property(nonatomic, strong)UILabel *tipLabel;

@end

@implementation BFLearnIGlistLabelCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit {
    
    self.tipLabel = [[UILabel alloc]init];
    
}

@end
