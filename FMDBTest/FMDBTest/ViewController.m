//
//  ViewController.m
//  FMDBTest
//
//  Created by JL on 15/12/17.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "ChatDataSQLTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"home = %@",NSHomeDirectory());
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick{
    ChatDataSQLTool *chatDataSQLTool = [ChatDataSQLTool shareInstance];
    [chatDataSQLTool saveChatWithUserID:@"1" withDataType:ChatDataSQLTypeImage withUrlStr:@"abc" withStartData:1 withEndData:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
