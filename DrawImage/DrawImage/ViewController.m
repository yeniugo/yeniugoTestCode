//
//  ViewController.m
//  DrawImage
//
//  Created by JL on 15/9/17.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "MyDrawView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyDrawView *view = [[MyDrawView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
