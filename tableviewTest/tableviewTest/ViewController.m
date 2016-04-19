//
//  ViewController.m
//  tableviewTest
//
//  Created by JL on 15/9/14.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#define WS(weakSelf)                   __weak __typeof(&*self)weakSelf = self;
@interface ViewController ()
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIButton *testButton;
@property (nonatomic,strong) UITableView *strongTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.strongTableView = self.tableView;
    
    UIView *backView = [[UIView alloc] init];
    backView.hidden = YES;
    backView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:backView];
    self.backView = backView;
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButton addTarget:self action:@selector(testButtonClick) forControlEvents:UIControlEventTouchUpInside];
    testButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testButton];
    self.testButton = testButton;
}

-(void)testButtonClick
{
    
    NSLog(@"%@",self.view);
    if (self.strongTableView.hidden) {
        self.view = self.strongTableView;
        [self.view addSubview:self.testButton];
        self.strongTableView.hidden = NO;
        self.backView.hidden = YES;
    }else{
        self.view = self.backView;
        [self.view addSubview:self.testButton];
        self.strongTableView.hidden = YES;
        self.backView.hidden = NO;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.backView.frame = self.tableView.frame;
    self.strongTableView.frame = self.tableView.frame;
    self.testButton.frame = CGRectMake(100, 100, 100, 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
