//
//  MyDrawView.m
//  DrawImage
//
//  Created by JL on 15/9/17.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "MyDrawView.h"

@implementation MyDrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0, 0, 1);
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    CGRect rectCircle1 = CGRectMake(0, 0, rect.size.width*0.5, rect.size.height*0.5);
    CGContextAddEllipseInRect(context,rectCircle1);
    CGContextClip(context);
    UIImage *image1 = [UIImage imageNamed:@"bg.png"];
    [image1 drawInRect:rectCircle1];
    UIGraphicsEndImageContext();
//    UIGraphicsBeginImageContext(rect.size);
//    CGRect rectCircle2 = CGRectMake(rect.size.width*0.5, rect.size.height*0.5, rect.size.width*0.5, rect.size.height*0.5);
//    CGContextAddEllipseInRect(context, rectCircle2);
//    CGContextClip(context);
//    [image1 drawInRect:rectCircle2];
//    UIGraphicsEndImageContext();
}

@end
