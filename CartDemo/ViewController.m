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
