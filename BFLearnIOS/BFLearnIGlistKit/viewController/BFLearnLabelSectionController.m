//
//  BFLearnLabelSectionController.m
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/1/27.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

#import "BFLearnLabelSectionController.h"
#import "BFLearnIGlistLabelCollectionViewCell.h"
#import "BFLearnIOS-Swift.h"

@implementation BFLearnLabelSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    BFLearnIGListDynamicCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[BFLearnIGListDynamicCollectionViewCell class] forSectionController:self atIndex:index];
    cell.text = @"这是深深的哈哈度丷u电话还堵啊电话还堵啊丷度丷u的丷u还堵啊好速度丷u说的话深度丷速度丷u深度啊还堵啊还堵啊u的丷u还堵啊";
    return cell;
}

-(NSInteger)numberOfItems {
    return 3;
}


- (void)didUpdateToObject:(id)object {
    
}

@end
