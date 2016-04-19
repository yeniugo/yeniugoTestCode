//
//  DrawView.m
//  testDraw
//
//  Created by JL on 15/7/29.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, CGRectMake(100, 100, 100, 100));
    CGContextSetRGBStrokeColor(context,0.5,0.5,0.5,1);
    CGContextFillRect(context,rect);
}

@end
