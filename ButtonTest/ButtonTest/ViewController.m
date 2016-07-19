//
//  ViewController.m
//  ButtonTest
//
//  Created by JL on 15/8/25.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "MyselfButton.h"
#import "RightImageButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyselfButton *button = [MyselfButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:button];
    
    RightImageButton *rightImageBtn = [[RightImageButton alloc] init];
    [rightImageBtn setImage:[UIImage imageNamed:@"产品jiantou.png"] forState:UIControlStateNormal];
    [rightImageBtn setTitle:@"11111" forState:UIControlStateNormal];
    [rightImageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:rightImageBtn];
    rightImageBtn.frame = CGRectMake(0, 0, 100, 40);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
