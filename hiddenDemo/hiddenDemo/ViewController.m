//
//  ViewController.m
//  hiddenDemo
//
//  Created by JL on 15/6/16.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak) UIButton *chatButton;
@property (nonatomic,weak) UIButton *contactsButton;
@property (nonatomic,weak) UIButton *centerPersonButton;
@property (nonatomic,weak) UIButton *searchAllButton;
@property (nonatomic,weak) UIButton *personalButton;
@property (nonatomic,weak) UIImageView *backgroundView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        UIImageView *backgroundView = [[UIImageView alloc] init];
        backgroundView.backgroundColor = [UIColor yellowColor];
        backgroundView.userInteractionEnabled = YES;
        self.backgroundView = backgroundView;
        [self.view addSubview:backgroundView];
    
        UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        chatButton.tag = 0;
        self.chatButton = chatButton;
        [self.backgroundView addSubview:chatButton];
        chatButton.backgroundColor= [UIColor redColor];
//        [chatButton addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchDown];
    
        UIButton *contactsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        contactsButton.tag = 1;
        self.contactsButton = contactsButton;
        [self.backgroundView addSubview:contactsButton];
        contactsButton.backgroundColor = [UIColor blueColor];
//        [contactsButton addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchDown];
    
        UIButton *centerPersonButton = [UIButton buttonWithType:UIButtonTypeCustom];
        centerPersonButton.tag = 2;
        self.centerPersonButton = centerPersonButton;
        [self.backgroundView addSubview:centerPersonButton];
        centerPersonButton.backgroundColor = [UIColor orangeColor];
//        [centerPersonButton addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchDown];
    
        UIButton *searchAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
        searchAllButton.tag = 3;
        self.searchAllButton = searchAllButton;
        [self.backgroundView addSubview:searchAllButton];
        searchAllButton.backgroundColor = [UIColor purpleColor];
//        [searchAllButton addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchDown];
    
        UIButton *personalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        personalButton.tag = 4;
        self.personalButton = personalButton;
        [self.backgroundView addSubview:personalButton];
        personalButton.backgroundColor = [UIColor brownColor];
//        [personalButton addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchDown];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
