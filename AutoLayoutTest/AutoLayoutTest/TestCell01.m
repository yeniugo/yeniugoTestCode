//
//  TestCell01.m
//  AutoLayoutTest
//
//  Created by 宇中 on 16/7/11.
//  Copyright © 2016年 LuoXingBin. All rights reserved.
//

#import "TestCell01.h"
#import "SDAutoLayout.h"
#import "TestModel01.h"

@interface TestCell01 ()
@property (nonatomic,strong) UILabel *firstLabel;/**<  */
@property (nonatomic,strong) UILabel *secondLabel;/**<  */
@end

@implementation TestCell01
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)setupUI{
    self.firstLabel = [[UILabel alloc] init];
    self.firstLabel.backgroundColor = [UIColor redColor];
    self.firstLabel.textColor = [UIColor blackColor];
    self.firstLabel.numberOfLines = 0;
    [self.contentView addSubview:self.firstLabel];
    
    self.secondLabel = [[UILabel alloc] init];
    self.secondLabel.backgroundColor = [UIColor yellowColor];
    self.secondLabel.textColor = [UIColor blackColor];
    self.secondLabel.numberOfLines = 0;
    [self.contentView addSubview:self.secondLabel];
    
    self.firstLabel.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 5)
    .autoHeightRatio(0);
    
    self.secondLabel.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(_firstLabel, 5)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:self.secondLabel bottomMargin:10];
}

-(void)setCellData:(TestModel01 *)cellData{
    _cellData = cellData;
    
    self.firstLabel.text = cellData.firstStr;
    self.secondLabel.text = cellData.secondStr;
}
@end
