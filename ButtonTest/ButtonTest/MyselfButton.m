//
//  MyselfButton.m
//  ButtonTest
//
//  Created by JL on 15/8/25.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "MyselfButton.h"

@interface MyselfButton ()
@property (nonatomic,weak) UIImageView *iconImageView;
@end

@implementation MyselfButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.masksToBounds = YES; //没这句话它圆不起来
        self.layer.cornerRadius = 4.0; //设置图片圆角的大小
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        self.backgroundColor = [UIColor grayColor];
        iconImageView.backgroundColor = [UIColor redColor];
        
        iconImageView.layer.masksToBounds = YES; //没这句话它圆不起来
        iconImageView.layer.cornerRadius = 4.0; //设置图片圆角的大小
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.iconImageView.frame = CGRectMake(4, 4, self.frame.size.width-8, self.frame.size.height-8);
}

@end
