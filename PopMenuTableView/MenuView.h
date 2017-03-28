//
//  MenuView.h
//  PopMenuTableView
//
//  Created by cyf on 2017/3/28.
//  Copyright © 2017年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuModel.h"


typedef enum : NSUInteger {
    MenuViewLocationLeft,
    MenuViewLocationCenter,
    MenuViewLocationRight,
} MenuViewLocation;

typedef void(^ItemsClickBlock)(NSString *str, NSInteger tag);

@interface MenuView : UIView

@property (nonatomic,copy) ItemsClickBlock itemsClickBlock;

/**
 菜单数据的列表
 */
@property (nonatomic,strong) NSArray * dataArray;

/**
 菜单的位置
 */
@property (nonatomic, assign) MenuViewLocation menuViewLocation;

/**
 *  menu
 *
 *  @param menuViewLocation 菜单的位置
 *  @param target           将在在何控制器弹出
 *  @param dataArray        菜单项内容
 *  @param itemsClickBlock  点击某个菜单项的blick
 *
 *  @return 返回创建对象
 */

- (instancetype)initWith:(MenuViewLocation)menuViewLocation target:(UIViewController *)target dataArray:(NSArray *)dataArray itemsClickBlock:(void (^)(NSString *, NSInteger))itemsClickBlock;

/**
 *  展示菜单
 *
 *  @param isShow YES:展示  NO:隐藏
 */
- (void)showMenuWithAnimation;

/**
 *  移除菜单
 */
- (void)clearMenu;

@end
