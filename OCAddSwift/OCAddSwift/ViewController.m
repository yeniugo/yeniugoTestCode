//
//  ViewController.m
//  OCAddSwift
//
//  Created by JL on 16/4/11.
//  Copyright © 2016年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "OCAddSwift-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TestSwift *test = [[TestSwift alloc] init];
    NSString *str = [test test];
    NSLog(@"%@",str);
    [test testNew];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
