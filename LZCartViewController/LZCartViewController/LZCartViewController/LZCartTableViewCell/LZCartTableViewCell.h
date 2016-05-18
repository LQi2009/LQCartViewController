//
//  LZCartTableViewCell.h
//  LZCartViewController
//
//  Created by Artron_LQQ on 16/5/18.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZCartModel;
typedef void(^LZNumberChangedBlock)(NSInteger number);
typedef void(^LZCellSelectedBlock)(BOOL select);
@interface LZCartTableViewCell : UITableViewCell
//商品数量
@property (assign,nonatomic)NSInteger lzNumber;
@property (assign,nonatomic)BOOL lzSelected;

- (void)LZReloadDataWithModel:(LZCartModel*)model;
- (void)LZNumberAddWithBlock:(LZNumberChangedBlock)block;
- (void)LZNumberCutWithBlock:(LZNumberChangedBlock)block;
- (void)LZCellSelectedWithBlock:(LZCellSelectedBlock)block;
@end
