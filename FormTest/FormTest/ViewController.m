//
//  ViewController.m
//  FormTest
//
//  Created by JL on 15/4/16.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "HKNetPostForm.h"
#import "MJExtension.h"
#import "HKGetSalt.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postMessage:(id)sender {
    NSString *urlStr = @"http://app-backend.youths.org.cn/MobileApi/User/getsalt";
    NSString *userName = @"18671280320";
    NSString *bodyStr = [NSString stringWithFormat:@"strUserName=%@",userName];
    [HKNetPostForm postURL:urlStr body:bodyStr success:^(id responseObject){
        
        NSString *json =[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",json);
        HKGetSalt *getSalt = [HKGetSalt objectWithKeyValues:json];
        NSLog(@"%d,%d,%@",getSalt.Data.nUserID,getSalt.Data.nTime,getSalt.Data.strSalt);
        
    } failure:^(NSError *error) {
        NSLog(@"failure");
    }];
}

@end
