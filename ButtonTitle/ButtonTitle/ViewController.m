//
//  ViewController.m
//  ButtonTitle
//
//  Created by 林盼盼 on 16/6/8.
//  Copyright © 2016年 zyfoolboy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 60, 30);
    /**
     *  Description
     */
    
    [btn setImage:[UIImage imageNamed:@"item_grid_filter_price_arrow"] forState:UIControlStateNormal];
    
    [btn setTitle:@"选择" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(5, 45, 5, 0);
    
    NSLog(@"%@", NSStringFromCGRect(btn.imageView.frame));
    NSLog(@"%@", NSStringFromCGRect(btn.titleLabel.frame));
    
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
