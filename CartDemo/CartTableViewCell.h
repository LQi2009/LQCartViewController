//
//  CartTableViewCell.h
//  ArtronUp
//
//  Created by Artron_LQQ on 15/12/1.
//  Copyright © 2015年 ArtronImages. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartModel.h"
#import "Masonry.h"

//16进制RGB的颜色转换
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//R G B 颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//红色
#define BASECOLOR_RED [UIColor \
colorWithRed:((float)((0xED5565 & 0xFF0000) >> 16))/255.0 \
green:((float)((0xED5565 & 0xFF00) >> 8))/255.0 \
blue:((float)(0xED5565 & 0xFF))/255.0 alpha:1.0]

/**
 *  @author LQQ, 16-02-18 11:02:02
 *
 *  cell是否被选中的回调
 *
 *  @param select 是否被选中
 */
typedef void(^LQQCartBlock)(BOOL select);

/**
 *  @author LQQ, 16-02-18 11:02:48
 *
 *  数量改变的回调
 */
typedef void(^LQQNumChange)();
@interface CartTableViewCell : UITableViewCell

//数量
@property (nonatomic,retain)UILabel *numberLabel;
@property (nonatomic,assign)BOOL isSelected;
@property (nonatomic,copy)LQQCartBlock cartBlock;
@property (nonatomic,copy)LQQNumChange numAddBlock;
@property (nonatomic,copy)LQQNumChange numCutBlock;

/**
 *  @author LQQ, 16-02-18 11:02:39
 *
 *  刷新cell
 *
 *  @param model cell数据模型
 */
-(void)reloadDataWith:(CartModel*)model;
@end
