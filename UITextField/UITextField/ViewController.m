//
//  ViewController.m
//  UITextField
//
//  Created by JL on 15/6/5.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "MyTextField.h"
@interface ViewController ()
@property (nonatomic,weak) MyTextField *testField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITextField *testField = [[MyTextField alloc] init];
    testField.placeholder = @"test";
    testField.frame = CGRectMake(50, 50, 200, 50);
    testField.backgroundColor = [UIColor redColor];
    [self.view addSubview:testField];
    self.testField = testField;
    testField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
    testField.leftViewMode = UITextFieldViewModeAlways;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
