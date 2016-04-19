//
//  LineTableViewCell.m
//  LineTest
//
//  Created by JL on 16/1/19.
//  Copyright © 2016年 Youths. All rights reserved.
//

#import "LineTableViewCell.h"

@interface LineTableViewCell ()
@property (nonatomic,weak) UIView *lineView;/**< 线 */
@property (nonatomic,strong) CALayer *lineLayer;/**< 线 */
@end

@implementation LineTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor redColor];
        [self addSubview:lineView];
        self.lineView = lineView;
        
        CALayer *lineLayer = [[CALayer alloc] init];
        lineLayer.backgroundColor = [UIColor blueColor].CGColor;
        [self.contentView.layer addSublayer:lineLayer];
        self.lineLayer = lineLayer;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.lineView.frame = CGRectMake(0, self.frame.size.height-2, [UIScreen mainScreen].bounds.size.width, 0.5);
    self.lineLayer.frame = CGRectMake(0, self.frame.size.height-5, [UIScreen mainScreen].bounds.size.width, 0.5);
}

@end
