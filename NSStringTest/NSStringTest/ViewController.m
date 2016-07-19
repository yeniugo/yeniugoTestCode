//
//  ViewController.m
//  NSStringTest
//
//  Created by 宇中 on 16/7/15.
//  Copyright © 2016年 LuoXingBin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *needText = @"2313131312";
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0,1)];
    
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(1,needText.length-1)];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:10]};
    NSRange rang = NSMakeRange(, needText.length );
    [attrString addAttributes:dic range:rang];
    
    UILabel *testLabel = [[UILabel alloc] init];
    [testLabel setAttributedText:attrString];
    testLabel.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:testLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
