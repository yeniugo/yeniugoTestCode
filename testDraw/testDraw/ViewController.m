//
//  ViewController.m
//  testDraw
//
//  Created by JL on 15/7/29.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DrawView *drawView = [[DrawView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
