//
//  MenuTableViewCell.m
//  PopMenuTableView
//
//  Created by cyf on 2017/3/28.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "CustomView.h"

typedef enum : NSUInteger {
    RoundedDirectionNormal,
    RoundedDirectionTop,
    RoundedDirectionBottom,
    RoundedDirectionAll,
} RoundedDirection;

@interface MenuTableViewCell ()
@property (nonatomic, assign) RoundedDirection roundedDirection;
@end

@implementation MenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = RGBColor(63, 70, 73, 1);
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.textLabel.textColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)showInfoModel:(MenuModel *)menuModel withIndexPath:(NSIndexPath *)indexPath arrayCount:(NSInteger)arrayCount{
    if (!self.textLabel.text) {
        if (arrayCount == 1 && indexPath.row == 0) {
            self.roundedDirection = RoundedDirectionAll;
        }else if (arrayCount >= 1 && indexPath.row == 0){
            self.roundedDirection = RoundedDirectionTop;
        }else if (arrayCount > 1 && indexPath.row == arrayCount - 1){
            self.roundedDirection = RoundedDirectionBottom;
        }else{
            self.roundedDirection = RoundedDirectionNormal;
        }

    }
    
    if (menuModel.cellSelected) {
        self.imageView.image = [UIImage imageNamed:menuModel.imageNameSelect.length > 0 ? menuModel.imageNameSelect : menuModel.imageNameNormal];
        self.textLabel.text = menuModel.itemNameSelect.length > 0 ? menuModel.itemNameSelect : menuModel.itemNameNormal;
    }else{
        self.imageView.image = [UIImage imageNamed:menuModel.imageNameNormal];
        self.textLabel.text = menuModel.itemNameNormal;
    }

}


- (void)setRoundedDirection:(RoundedDirection)roundedDirection{
    _roundedDirection = roundedDirection;
    UIRectCorner rectCorner;
    switch (roundedDirection) {
        case RoundedDirectionNormal:{

        }
            break;
            
        case RoundedDirectionTop:{
            rectCorner = UIRectCornerTopLeft | UIRectCornerTopRight;

        }
            break;
            
        case RoundedDirectionBottom:{
            rectCorner = UIRectCornerBottomLeft | UIRectCornerBottomRight;

        }
            break;
            
        case RoundedDirectionAll:{
            rectCorner = UIRectCornerAllCorners;
        }
            break;
            
        default:
            break;
    }
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}




@end
