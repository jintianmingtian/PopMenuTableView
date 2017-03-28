//
//  MenuTableViewCell.h
//  PopMenuTableView
//
//  Created by cyf on 2017/3/28.
//  Copyright © 2017年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuModel.h"


@interface MenuTableViewCell : UITableViewCell

- (void)showInfoModel:(MenuModel *)menuModel withIndexPath:(NSIndexPath *)indexPath arrayCount:(NSInteger)arrayCount;


@end
