//
//  LZNavigationTool.h
//  UINavigationBar
//
//  Created by Artron_LQQ on 16/7/21.
//  Copyright © 2016年 Artup. All rights reserved.
//
// nullable 可为nil
// nonnull 不可为nil

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LZNavigationTool : NSObject

+ (void)naviBarInViewController:(nonnull UIViewController *)vc backgroundColor:(nullable UIColor *)color;

+ (void)naviBarInViewController:(nonnull UIViewController *)vc backgroundImage:(nullable NSString *)imageName;
+ (void)naviBarInViewController:(nonnull UIViewController *)vc backgroundImageWithColor:(nullable UIColor *)color alpha:(CGFloat)alpha;
+ (void)addLeftBarButtonToViewController:(nonnull UIViewController *)vc withTitle:(nullable NSString *)title target:(nullable id)target action:(nullable SEL)action;
+ (void)addLeftBarButtonToViewController:(nonnull UIViewController *)vc withImageName:(nullable NSString *)imageName target:(nullable id)target action:(nullable SEL)action;
+ (void)addRightBarButtonToViewController:(nonnull UIViewController *)vc withTitle:(nullable NSString *)title target:(nullable id)target action:(nullable SEL)action;
+ (void)addRightBarButtonToViewController:(nonnull UIViewController *)vc withImageName:(nullable NSString *)imageName target:(nullable id)target action:(nullable SEL)action;
@end

