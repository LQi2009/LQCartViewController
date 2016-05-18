//
//  LZConfigFile.h
//  LZCartViewController
//
//  Created by Artron_LQQ on 16/5/18.
//  Copyright © 2016年 Artup. All rights reserved.
//

#ifndef LZConfigFile_h
#define LZConfigFile_h
#import "UIViewExt.h"

//16进制RGB的颜色转换
#define LZColorFromHex(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//R G B 颜色
#define LZColorFromRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//红色
#define BASECOLOR_RED [UIColor \
colorWithRed:((float)((0xED5565 & 0xFF0000) >> 16))/255.0 \
green:((float)((0xED5565 & 0xFF00) >> 8))/255.0 \
blue:((float)(0xED5565 & 0xFF))/255.0 alpha:1.0]



#define LZSCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
#define LZSCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define LZNaigationBarHeight 64
#define LZTabBarHeight 49

#define  TAG_CartEmptyView 100


static NSString *lz_BackButtonString = @"back_button";
static NSString *lz_Bottom_UnSelectButtonString = @"cart_unSelect_btn";
static NSString *lz_Bottom_SelectButtonString = @"cart_selected_btn";
static NSString *lz_CartEmptyString = @"cart_default_bg";
static NSInteger lz_CartRowHeight = 100;
#endif /* LZConfigFile_h */
