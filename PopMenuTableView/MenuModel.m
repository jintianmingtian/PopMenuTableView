//
//  MenuModel.m
//  PopMenuTableView
//
//  Created by cyf on 2017/3/28.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "MenuModel.h"

@implementation MenuModel

- (instancetype)initWithImageNameNormal:(NSString *)imageNameNormal
                         itemNameNormal:(NSString *)itemNameNormal{
    self = [super init];
    if (self) {
        self.imageNameNormal = imageNameNormal;
        self.itemNameNormal = itemNameNormal;
    }
    return self;
}

- (instancetype)initWithImageNameNormal:(NSString *)imageNameNormal
                         itemNameNormal:(NSString *)itemNameNormal
                         imageNameSelect:(NSString *)imageNameSelect
                         itemNameSelect:(NSString *)itemNameSelect
                         cellSelected:(BOOL )cellSelected {
    self = [super init];
    if (self) {
        self.imageNameNormal = imageNameNormal;
        self.itemNameNormal = itemNameNormal;
        self.imageNameSelect = imageNameSelect;
        self.itemNameSelect = itemNameSelect;
        self.cellSelected = cellSelected;
    }
    return self;
}

@end
