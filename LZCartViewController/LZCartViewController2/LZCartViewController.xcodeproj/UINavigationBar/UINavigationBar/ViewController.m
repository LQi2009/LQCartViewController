//
//  ViewController.m
//  UINavigationBar
//
//  Created by Artron_LQQ on 16/7/21.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "LZNavigationTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.leftBarButtonItem
    self.title = @"aaaaa";
//    [LZNavigationTool setNavigationBackgroundColor:[UIColor redColor]];
//    
//    [LZNavigationTool addLeftBarButtonToViewController:self withTitle:@"back" target:self action:@selector(back)];
    
//    [LZNavigationTool setNavBarBackgroundImageWithColor:[UIColor orangeColor] alpha:0.5];
    
    [LZNavigationTool naviBarInViewController:self backgroundImage:@"40fe711f9b754b596159f3a6.jpg"];
    [LZNavigationTool naviBarInViewController:self backgroundColor:[UIColor redColor]];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"40fe711f9b754b596159f3a6.jpg"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
