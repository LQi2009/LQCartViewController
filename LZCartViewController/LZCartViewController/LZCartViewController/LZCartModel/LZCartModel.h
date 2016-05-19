//
//  LZCartModel.h
//  LZCartViewController
//
//  Created by Artron_LQQ on 16/5/18.
//  Copyright © 2016年 Artup. All rights reserved.
//  https://github.com/LQQZYY/CartDemo

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LZCartModel : NSObject
//自定义模型时,这三个属性必须有
@property (nonatomic,assign) BOOL select;
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,copy) NSString *price;
//下面的属性可根据自己的需求修改
@property (nonatomic,copy) NSString *sizeStr;
@property (nonatomic,copy) NSString *nameStr;
@property (nonatomic,copy) NSString *dateStr;
@property (nonatomic,retain)UIImage *image;

@end
