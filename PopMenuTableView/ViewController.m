//
//  ViewController.m
//  PopMenuTableView
//
//  Created by cyf on 2017/3/28.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"

@interface ViewController ()
@property (nonatomic, strong) MenuView * menuView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MenuModel * model1 = [[MenuModel alloc] initWithImageNameNormal:@"icon_button_affirm" itemNameNormal:@"撤回"];
    MenuModel * model2 = [[MenuModel alloc] initWithImageNameNormal:@"icon_button_recall" itemNameNormal:@"确认"];
    MenuModel * model3 = [[MenuModel alloc] initWithImageNameNormal:@"icon_button_record" itemNameNormal:@"记录"];
    
    NSArray *dataArray = @[model1, model2, model3];
   
    __weak __typeof(&*self)weakSelf = self;
    self.menuView = [[MenuView alloc] initWith:MenuViewLocationRight target:self.navigationController dataArray:dataArray itemsClickBlock:^(NSString * str, NSInteger tag) {
        [weakSelf doSomething:(NSString *)str tag:(NSInteger)tag];

    }];
}

- (IBAction)popMenu:(id)sender {
    [self.menuView showMenuWithAnimation];
}

- (void)doSomething:(NSString *)str tag:(NSInteger)tag{
    
    MenuModel * model1 = [[MenuModel alloc] initWithImageNameNormal:@"icon_button_affirm" itemNameNormal:@"撤回"];
    MenuModel * model2 = [[MenuModel alloc] initWithImageNameNormal:@"icon_button_recall" itemNameNormal:@"确认" imageNameSelect:@"icon_button_affirm" itemNameSelect:@"" cellSelected:YES];
    MenuModel * model3 = [[MenuModel alloc] initWithImageNameNormal:@"icon_button_record" itemNameNormal:@"记录"];
    
    NSArray *dataArray = @[model1, model2, model3];
    
    self.menuView.dataArray = dataArray;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:str message:[NSString stringWithFormat:@"点击了第%ld个菜单项",tag] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)dealloc{
    [self.menuView clearMenu];   // 移除菜单
}

@end
