//
//  LZTableHeaderView.m
//  LZCartViewController
//
//  Created by Artron_LQQ on 16/5/31.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZTableHeaderView.h"
#import "LZConfigFile.h"

@interface LZTableHeaderView ()

@property (strong,nonatomic)UILabel *titleLabel;
@property (strong,nonatomic)UIButton *button;
@end
@implementation LZTableHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(5, 15, 50, 30);
    
    [button setImage:[UIImage imageNamed:@"cart_unSelect_btn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"cart_selected_btn"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    self.button = button;
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(70, 15, LZSCREEN_WIDTH - 100, 30);
    label.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:label];
    self.titleLabel = label;
}
- (void)buttonClick:(UIButton*)button {
    button.selected = !button.selected;
    
    if (self.lzClickBlock) {
        self.lzClickBlock(button.selected);
    }
}

- (void)setSelect:(BOOL)select {
    
    self.button.selected = select;
    _select = select;
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
    _title = title;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
