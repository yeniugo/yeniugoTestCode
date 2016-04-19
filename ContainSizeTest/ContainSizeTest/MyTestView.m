//
//  MyTestView.m
//  ContainSizeTest
//
//  Created by JL on 16/1/4.
//  Copyright © 2016年 Youths. All rights reserved.
//

#import "MyTestView.h"

@interface MyTestView ()
@property (nonatomic,weak) UIScrollView *backgroundScrollview;/**< 背景 */
@end

@implementation MyTestView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)layoutSubviews{
    
}

@end
