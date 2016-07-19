//
//  ViewController.m
//  UITableViewWithWebView
//
//  Created by 宇中 on 16/6/22.
//  Copyright © 2016年 LuoXingBin. All rights reserved.
//

#import "ViewController.h"
#import "WebViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,WebViewCellDelegate>
@property (nonatomic,strong) UITableView *tableView;/**< tableView */
@property (nonatomic,assign) CGFloat cellHeight;/**< <#属性#> */
@end

@implementation ViewController

-(UITableView *)tableView{
    if (_tableView == nil) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.estimatedRowHeight = 44.0f;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
//        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row<0) {
        static NSString *cellID = @"UITableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
        return cell;
    }else{
        static NSString *cellID = @"WebViewCell";
        WebViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[WebViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.delegate = self;
        }
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row<0) {
        return 40;
    }else{
        if (self.cellHeight<=0) {
            CGFloat h = [UIScreen mainScreen].bounds.size.height;
            return h;
        }else{
            return self.cellHeight;
        }
    }
}

-(void)setWebViewCellHeight:(CGFloat)height{
    self.cellHeight = height;
    [self.tableView reloadData];
    NSLog(@"set cell height");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
