//
//  ViewController.m
//  strengthImageTest
//
//  Created by JL on 15/8/28.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+StretchImage.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.testImageView.image = [UIImage stretchImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chat_red-bj_ic" ofType:@"png"]]];
    self.testImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.testImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chat_red-bj_ic" ofType:@"png"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
