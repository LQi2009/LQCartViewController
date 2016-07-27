//
//  LZNavigationTool.m
//  UINavigationBar
//
//  Created by Artron_LQQ on 16/7/21.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZNavigationTool.h"

@implementation LZNavigationTool

+ (void)naviBarInViewController:(UIViewController *)vc backgroundColor:(UIColor *)color {
    
    vc.navigationController.navigationBar.barTintColor = color;
}
+ (void)naviBarInViewController:(UIViewController *)vc backgroundImage:(NSString *)imageName {
    
//    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
    
    [vc.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
}

+ (void)naviBarInViewController:(UIViewController *)vc backgroundImageWithColor:(UIColor *)color alpha:(CGFloat)alpha {
    
    UIImage *image = [self imageWithColor:[color colorWithAlphaComponent:alpha]];
    
//    [[UINavigationBar appearance]setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [vc.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
+ (void)addLeftBarButtonToViewController:(UIViewController *)vc withTitle:(NSString *)title target:(nullable id)target action:(nullable SEL)action {
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    barButton.tintColor = [UIColor redColor];
    
    vc.navigationItem.leftBarButtonItem = barButton;
    
}

+ (void)addLeftBarButtonToViewController:(UIViewController *)vc withImageName:(NSString *)imageName target:(nullable id)target action:(nullable SEL)action{
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:target action:action];
    vc.navigationItem.leftBarButtonItem = barButton;
}

+ (void)addRightBarButtonToViewController:(UIViewController *)vc withTitle:(NSString *)title target:(nullable id)target action:(nullable SEL)action{
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    
    vc.navigationItem.rightBarButtonItem = barButton;
}

+ (void)addRightBarButtonToViewController:(UIViewController *)vc withImageName:(NSString *)imageName target:(nullable id)target action:(nullable SEL)action{
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:target action:action];
    vc.navigationItem.rightBarButtonItem = barButton;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
