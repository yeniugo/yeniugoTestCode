//
//  ViewController.m
//  MasonryTest
//
//  Created by 宇中 on 16/6/29.
//  Copyright © 2016年 LuoXingBin. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic,strong) UIButton *testView;/**< 测试 */
@end

@implementation ViewController

-(UIButton *)testView{
    if (_testView == nil) {
        _testView = [[UIButton alloc] init];
        _testView.backgroundColor = [UIColor redColor];
        [_testView addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_testView];
        
        __weak typeof(self) weakSelf = self;
        [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
    }
    return _testView;
}

-(void)buttonClick:(UIButton *)btn{
    btn.tag = !btn.tag;
    __weak typeof(self) weakSelf = self;
    if (btn.tag) {
        [self.testView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(weakSelf.view);
            make.top.equalTo(weakSelf.view).with.offset(100);
            make.left.equalTo(weakSelf.view).with.offset(100);
            make.width.equalTo(@100);
            make.height.equalTo(@100);
        }];
    }else{
        [self.testView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
