//
//  ViewController.m
//  LZCartViewController
//
//  Created by Artron_LQQ on 16/5/18.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "LZCartViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)selector:(id)sender {
    LZCartViewController *cart = [[LZCartViewController alloc]init];
    
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:cart];
    [self presentViewController:cart animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
