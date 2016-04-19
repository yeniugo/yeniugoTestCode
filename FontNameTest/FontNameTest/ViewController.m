//
//  ViewController.m
//  FontNameTest
//
//  Created by JL on 15/8/18.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self chestFontName];
    UILabel *testLabel = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:testLabel];
    testLabel.textColor = [UIColor blackColor];
    testLabel.font = [UIFont fontWithName:@"FZLTXIHJW--GB1-0" size:30];
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.text = @"test中国人，test";
}

-(void)chestFontName
{
    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
