//
//  ViewController.m
//  AutoLayoutTest
//
//  Created by 宇中 on 16/7/11.
//  Copyright © 2016年 LuoXingBin. All rights reserved.
//

#import "ViewController.h"
#import "SDAutoLayout.h"
#import "TestCell01.h"
#import "TestModel01.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;/**< <#属性#> */
@property (nonatomic,strong) NSArray *dataArray;/**< 数据源 */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TestModel01 *model01 = [[TestModel01 alloc] init];
    model01.firstStr = @"123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123";
    model01.secondStr = @"532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423532423423";
    TestModel01 *model02 = [[TestModel01 alloc] init];
    model02.firstStr = @"5345345534534553453455345345534534553453455345345534534553453455345345534534553453455345345534534553453455345345";
    model02.secondStr = @"879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879879";
    TestModel01 *model03 = [[TestModel01 alloc] init];
    model03.firstStr = @"3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333";
    model03.secondStr = @"980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080980809808098080";
    self.dataArray = @[model01,model02,model03];
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"test01";
    TestCell01 *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[TestCell01 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.cellData = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataArray[indexPath.row];
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"cellData" cellClass:[TestCell01 class] contentViewWidth:[self cellContentViewWith]];
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}


-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
        _tableView.sd_layout
        .leftSpaceToView(self.view, 0)
        .rightSpaceToView(self.view, 0)
        .topSpaceToView(self.view, 0)
        .bottomSpaceToView(self.view, 0);
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
