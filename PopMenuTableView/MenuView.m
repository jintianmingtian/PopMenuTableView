//
//  MenuView.m
//  PopMenuTableView
//
//  Created by cyf on 2017/3/28.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "MenuView.h"
#import "MenuModel.h"
#import "MenuTableViewCell.h"
#import "CustomView.h"
#define MENU_TAG 99999
#define BACKVIEW_TAG 88888

#define HeaderViewHeight 10
#define TableViewRowHeight 40

@interface MenuView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIViewController * target;
@property (nonatomic,assign) BOOL flag;
@property (nonatomic, strong) CustomView * customView;
@end

@implementation MenuView

//setter
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self.tableView reloadData];
}

/**
 设置视图的 frame
 
 @param menuViewLocation 位置
 @param dataArray 菜单的数组
 @return frame
 */
- (CGRect)getFrmeWith:(MenuViewLocation)menuViewLocation dataArray:(NSArray *)dataArray{
    
    // 计算菜单frame
    CGFloat x;
    CGFloat y = 64 - 10;
    CGFloat width = [UIScreen mainScreen].bounds.size.width  * 0.3;
    CGFloat height = HeaderViewHeight +  TableViewRowHeight * dataArray.count;
    
    switch (menuViewLocation) {
        case MenuViewLocationLeft:{
            x = [UIScreen mainScreen].bounds.size.width / 3 * 1 - [UIScreen mainScreen].bounds.size.width  * 0.3;
        }
            break;
            
        case MenuViewLocationCenter:{
            x = [UIScreen mainScreen].bounds.size.width * 0.35;
        }
            break;
            
        case MenuViewLocationRight:{
            x = [UIScreen mainScreen].bounds.size.width / 3 * 2;
        }
            break;
            
        default:
            break;
    }
    
    CGRect frame = CGRectMake(x, y, width, height);
    return frame;
}

#pragma mark - headerView
- (UIView *)headerView{
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, HeaderViewHeight)];
    backView.backgroundColor = [UIColor clearColor];
    CGFloat x = self.bounds.size.width / 10 * 8;
    CGFloat width = self.bounds.size.width * 0.1;
    
    self.customView = [[CustomView alloc] initWithFrame:CGRectMake(x, 0, width, HeaderViewHeight)];
    [backView addSubview:self.customView];
    return backView;
}

#pragma mark -- initMenu
- (void)setUpUIWithFrame:(CGRect)frame{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.rowHeight = TableViewRowHeight;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.tableHeaderView = [self headerView];
    [self.tableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.target.view.bounds.size.width, self.target.view.bounds.size.height)];
    backView.backgroundColor = [UIColor clearColor];
    backView.alpha = 0.0;
    backView.userInteractionEnabled = YES;
    backView.tag = BACKVIEW_TAG;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [backView addGestureRecognizer:tap];
    self.backView = backView;
    
    [self.target.view addSubview:backView];
    [self addSubview:self.tableView];
}

#pragma mark -- UITapGestureRecognizer
- (void)tap:(UITapGestureRecognizer *)sender{
    [self showMenuWithAnimation];
}

- (instancetype)initWith:(MenuViewLocation)menuViewLocation target:(UIViewController *)target dataArray:(NSArray *)dataArray itemsClickBlock:(void (^)(NSString *, NSInteger))itemsClickBlock
{
    CGRect frame = [self getFrmeWith:menuViewLocation dataArray:dataArray];
    self = [super initWithFrame:frame];
    if (self) {
        self = [[MenuView alloc] initWithFrame:frame];
        self.tag = MENU_TAG;
        self.target = target;
        self.dataArray = dataArray;
        self.itemsClickBlock = itemsClickBlock;
        [self setUpUIWithFrame:frame];
        self.menuViewLocation = menuViewLocation;
        self.flag = YES;
        self.layer.anchorPoint = CGPointMake(1, 0);
        self.layer.position = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y);
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [target.view addSubview:self];
    }
    return self;
}


#pragma mark -- Show With Animation
- (void)showMenuWithAnimation{
    // 通过标示获取view
    MenuView *menuView = [[UIApplication sharedApplication].keyWindow viewWithTag:MENU_TAG];
    UIView *backView = [[UIApplication sharedApplication].keyWindow viewWithTag:BACKVIEW_TAG];
    [UIView animateWithDuration:0.25 animations:^{
        if (menuView.flag) {
            self.flag = NO;
            menuView.alpha = 1;
            backView.alpha = 0.1;
            menuView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }else{
            self.flag = YES;
            menuView.alpha = 0;
            backView.alpha = 0;
            menuView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        }
    }];
}


#pragma mark -- Hidden
- (void)hidden{
    [self showMenuWithAnimation];
}

- (void)clearMenu{
    [self showMenuWithAnimation];
    MenuView *menuView = [[UIApplication sharedApplication].keyWindow viewWithTag:MENU_TAG];
    UIView *backView = [[UIApplication sharedApplication].keyWindow viewWithTag:BACKVIEW_TAG];
    [menuView removeFromSuperview];
    [backView removeFromSuperview];
}


#pragma mark - 重新布局三角形的位置
- (void)layoutSubviews{
    CGFloat width = self.bounds.size.width * 0.1;
    switch (self.menuViewLocation) {
        case MenuViewLocationLeft:{
            CGFloat x = self.bounds.size.width / 10 * 1;
            self.customView.frame = CGRectMake(x, 0, width, HeaderViewHeight);
        }
            break;
            
        case MenuViewLocationCenter:{
            CGFloat x = self.bounds.size.width / 10 * 4.5;
            self.customView.frame = CGRectMake(x, 0, width, HeaderViewHeight);

        }
            break;
            
        case MenuViewLocationRight:{
            CGFloat x = self.bounds.size.width / 10 * 8;
            self.customView.frame = CGRectMake(x, 0, width, HeaderViewHeight);

        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 赋值视图的位置
- (void)setMenuViewLocation:(MenuViewLocation)menuViewLocation{
    _menuViewLocation = menuViewLocation;
    [self layoutSubviews];
}

#pragma mark -- UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuModel *model = self.dataArray[indexPath.row];
    MenuTableViewCell *cell = (MenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell showInfoModel:model withIndexPath:indexPath arrayCount:self.dataArray.count];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuModel *model = self.dataArray[indexPath.row];
    NSInteger tag = indexPath.row + 1;
    if (self.itemsClickBlock) {
        NSString * itemString = model.cellSelected ? model.itemNameSelect : model.itemNameNormal;
        self.itemsClickBlock(itemString,tag);
    }
    [self hidden];  // 隐藏菜单
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
