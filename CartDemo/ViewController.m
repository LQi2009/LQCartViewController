//
//  ViewController.m
//  CartDemo
//
//  Created by Artron_LQQ on 16/2/18.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "CartViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 40)];
    lab.text = @"点击任意地方去购物车";
    [self.view addSubview:lab];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CartViewController *cart = [[CartViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:cart];
    
    [[[UIApplication sharedApplication]delegate]window].rootViewController = nav;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
