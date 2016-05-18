//
//  LZCartModel.h
//  LZCartViewController
//
//  Created by Artron_LQQ on 16/5/18.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LZCartModel : NSObject
//自定义模型时,这两个属性必须有
@property (nonatomic,assign) BOOL select;
@property (nonatomic,assign) NSInteger number;
//下面的属性可根据自己的需求修改
@property (nonatomic,copy) NSString *sizeStr;
@property (nonatomic,copy) NSString *nameStr;
@property (nonatomic,copy) NSString *dateStr;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,retain)UIImage *image;

@end
