//
//  ViewController.m
//  ButtonTest
//
//  Created by JL on 15/8/25.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "MyselfButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyselfButton *button = [MyselfButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
