//
//  LZCartTableViewCell.h
//  LZCartViewController
//
//  Created by LQQ on 16/5/18.
//  Copyright © 2016年 LQQ. All rights reserved.
//  https://github.com/LQQZYY/CartDemo
//  http://blog.csdn.net/lqq200912408
//  QQ交流: 302934443

#import <UIKit/UIKit.h>

@class LZGoodsModel;
typedef void(^LZNumberChangedBlock)(NSInteger number);
typedef void(^LZCellSelectedBlock)(BOOL select);
@interface LZCartTableViewCell : UITableViewCell
//商品数量
@property (assign,nonatomic)NSInteger lzNumber;
@property (assign,nonatomic)BOOL lzSelected;

- (void)LZReloadDataWithModel:(LZGoodsModel*)model;
- (void)LZNumberAddWithBlock:(LZNumberChangedBlock)block;
- (void)LZNumberCutWithBlock:(LZNumberChangedBlock)block;
- (void)LZCellSelectedWithBlock:(LZCellSelectedBlock)block;
@end
