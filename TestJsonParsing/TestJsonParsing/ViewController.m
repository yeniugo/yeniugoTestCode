//
//  ViewController.m
//  TestJsonParsing
//
//  Created by JL on 15/11/13.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *jsonStr = @"{\"xg\":{\"bid\":0,\"ts\":1447388095},\"userid\":\"100632021\",\"fuserid\":\"100632021\",\"aps\":{\"alert\":\"\",\"badge\":1,\"sound\":\"beep.wav\"}}";
//    NSDictionary *userInfo = @{@"xg":
//                               @{@"bid":@0,@"ts":@1447388095},
//                           @"userid":@"100632021",
//                           @"fuserid":@"100632021",
//                           @"aps":@{@"alert":@"",@"badge":@1,@"sound":@"beep.wav"}
//                           };
////    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonStr options:0 error:nil];;
//    if ([[userInfo objectForKey:@"userid"] isEqualToString:[userInfo objectForKey:@"fuserid"]]&&((NSString *)[userInfo objectForKey:@"userid"]).length) {
//        NSLog(@"yes,is ok!");
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
