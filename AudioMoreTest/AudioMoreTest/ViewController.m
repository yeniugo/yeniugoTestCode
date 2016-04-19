//
//  ViewController.m
//  AudioMoreTest
//
//  Created by JL on 15/12/10.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "TouchButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TouchButton *btn = [TouchButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 50, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
