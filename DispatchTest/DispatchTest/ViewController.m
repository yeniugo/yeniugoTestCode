//
//  ViewController.m
//  DispatchTest
//
//  Created by JL on 16/1/13.
//  Copyright © 2016年 Youths. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSTimer *timer;/**< 定时器 */
@property (nonatomic,assign) int mini;/**< 最小值 */
@property (nonatomic,assign) int max;/**< 最大值 */
@property (nonatomic,assign) int theValue;/**< 当前值 */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(update) userInfo:nil repeats:YES];
    self.timer = timer;
    self.mini = 0;
    self.theValue = 0;
    self.max = 100;
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    testButton.frame = CGRectMake(100, 100, 100, 40);
    testButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:testButton];
    [testButton addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)testButtonClick:(UIButton *)btn{
    [self.timer invalidate];
}

-(void)update{
    if (self.theValue < self.max) {
        self.theValue = self.theValue+1;
        NSLog(@"%d",self.theValue);
    }else{
        [self.timer invalidate];
    }
//    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
