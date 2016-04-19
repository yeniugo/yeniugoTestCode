//
//  UIImage+StretchImage.m
//  WisdomMembersConstruction
//
//  Created by JL on 15/6/23.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "UIImage+StretchImage.h"

@implementation UIImage (StretchImage)
+(UIImage *)stretchImage:(UIImage *)srcImage
{
    UIImage *dstImage = [srcImage stretchableImageWithLeftCapWidth:srcImage.size.width*0.5 topCapHeight:srcImage.size.height*0.75];
    return dstImage;
}

+(instancetype)stretchImage:(UIImage *)srcImage withLeftRatio:(CGFloat)leftRatio withTopRatio:(CGFloat)topRatio
{
    UIImage *dstImage = [srcImage stretchableImageWithLeftCapWidth:srcImage.size.width*leftRatio topCapHeight:srcImage.size.height*topRatio];
    return dstImage;
}



@end
