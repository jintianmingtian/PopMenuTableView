//
//  MenuModel.h
//  PopMenuTableView
//
//  Created by cyf on 2017/3/28.
//  Copyright © 2017年 mc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuModel : NSObject

@property (nonatomic,copy) NSString *imageNameNormal;
@property (nonatomic,copy) NSString *itemNameNormal;
@property (nonatomic,assign) BOOL cellSelected;
@property (nonatomic,copy) NSString *imageNameSelect;
@property (nonatomic,copy) NSString *itemNameSelect;


/**
 初始化Model
 
 @param imageNameNormal 默认图片
 @param itemNameNormal 默认title
 @return Model
 */
- (instancetype)initWithImageNameNormal:(NSString *)imageNameNormal
                         itemNameNormal:(NSString *)itemNameNormal;

/**
 初始化Model  需要有选中效果的初始化

 @param imageNameNormal 默认图片
 @param itemNameNormal 默认title
 @param imageNameSelect 选择图片
 @param itemNameSelect 选择title
 @param cellSelected 是否选中
 @return Model
 */
- (instancetype)initWithImageNameNormal:(NSString *)imageNameNormal
                         itemNameNormal:(NSString *)itemNameNormal
                        imageNameSelect:(NSString *)imageNameSelect
                         itemNameSelect:(NSString *)itemNameSelect
                           cellSelected:(BOOL )cellSelected;
@end
