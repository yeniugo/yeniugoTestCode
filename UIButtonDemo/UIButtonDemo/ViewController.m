//
//  ViewController.m
//  UIButtonDemo
//
//  Created by JL on 16/4/7.
//  Copyright © 2016年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+Delay.h"
@interface ViewController ()
@property (nonatomic, strong) UIButton *suggessBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.suggessBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.suggessBtn setBackgroundColor:[UIColor blackColor]];
    self.suggessBtn.frame = CGRectMake(100, 100, 100, 100);
    [self.suggessBtn addTarget:self action:@selector(clickWithInterval:) forControlEvents:UIControlEventTouchUpInside];
    self.suggessBtn.cjr_acceptEventInterval = 5.0f;
    [self.view addSubview:self.suggessBtn];
}

- (void)clickWithInterval:(UIButton *)suButton{
    NSLog(@"打印出来－－");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
