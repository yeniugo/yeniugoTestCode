//
//  ViewController.m
//  DTCoreTextTest
//
//  Created by JL on 15/7/3.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "DTCoreText.h"
#import <CoreText/CoreText.h>
@interface ViewController ()
@property (nonatomic,weak) DTAttributedTextContentView *attributedTextContextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DTAttributedTextContentView *attributedTextContextView = [[DTAttributedTextContentView alloc] init];
    attributedTextContextView.shouldDrawImages = NO;
    NSString *html = @"<p>中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中</p>";
    NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
    
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithHTMLData:data
                                                               documentAttributes:NULL];
    attributedTextContextView.attributedString = attrString;
    attributedTextContextView.bounds = CGRectMake(0, 0, 200, 0);
//    attributedTextContextView.layoutFrameHeightIsConstrainedByBounds = YES;
    attributedTextContextView.backgroundColor = [UIColor redColor];
    [self.view addSubview:attributedTextContextView];
//    [attributedTextContextView suggestedFrameSizeToFitEntireStringConstraintedToWidth:[UIScreen mainScreen].bounds.size.width - 20];
//    [attributedTextContextView layoutIfNeeded];
//    [attributedTextContextView relayoutText];
//    [self.attributedTextContextView setNeedsLayout];
    
    self.attributedTextContextView = attributedTextContextView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    CGSize size = self.attributedTextContextView.layoutFrame.frame.size;
//    self.attributedTextContextView.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 100);
//    NSLog(@"%@",NSStringFromCGRect(self.attributedTextContextView.frame));
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//
    
//    self.attributedTextContextView.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 100);
    
    CGSize size = self.attributedTextContextView.layoutFrame.frame.size;
    CGRect rect = CGRectMake(10 , 10, size.width, size.height);
    self.attributedTextContextView.frame = rect;
    NSLog(@"%@",NSStringFromCGSize(size));
    NSLog(@"%@",NSStringFromCGRect(rect));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
