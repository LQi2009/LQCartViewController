//
//  LZShopModel.h
//  LZCartViewController
//
//  Created by Artron_LQQ on 16/5/31.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZShopModel : NSObject

@property (assign,nonatomic)BOOL select;
@property (copy,nonatomic)NSString *shopID;
@property (copy,nonatomic)NSString *shopName;
@property (copy,nonatomic)NSString *sID;
@property (strong,nonatomic,readonly)NSMutableArray *goodsArray;

- (void)configGoodsArrayWithArray:(NSArray*)array;
@end
