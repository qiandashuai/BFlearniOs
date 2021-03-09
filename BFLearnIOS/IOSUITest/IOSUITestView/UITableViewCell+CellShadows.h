//
//  UITableViewCell+CellShadows.h
//  BFLearnIOS
//
//  Created by blackstone jericho on 2020/9/24.
//  Copyright © 2020 blackstone jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (CellShadows)

- (void)addShadowToCellInTableView:(UITableView *)tableView
                       atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
