//
//  HKTabBarController.m
//  UITabBarShow
//
//  Created by JL on 15/4/20.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "HKTabBarController.h"

@interface HKTabBarController ()

@end

@implementation HKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",NSStringFromCGRect(self.tabBar.bounds));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
