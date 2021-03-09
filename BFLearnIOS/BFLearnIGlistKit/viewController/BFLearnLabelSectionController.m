//
//  BFLearnLabelSectionController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/27.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFLearnLabelSectionController.h"
#import "BFLearnIGlistLabelCollectionViewCell.h"

@implementation BFLearnLabelSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, self.collectionContext.containerSize.height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    BFLearnIGlistLabelCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[BFLearnIGlistLabelCollectionViewCell class] forSectionController:self atIndex:index];
    return cell;
}

-(NSInteger)numberOfItems {
    return 3;
}


- (void)didUpdateToObject:(id)object {
    
}

@end
