//
//  LineTableViewController.m
//  LineTest
//
//  Created by JL on 16/1/19.
//  Copyright © 2016年 Youths. All rights reserved.
//

#import "LineTableViewController.h"
#import "LineTableViewCell.h"

@interface LineTableViewController ()
@property (nonatomic,strong) NSArray *dataArray;/**< 数据源 */
@end

@implementation LineTableViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"LineTableViewCell";
    LineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[LineTableViewCell alloc] init];
    }
    return cell;
}

@end
