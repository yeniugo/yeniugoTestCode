//
//  ViewController.m
//  SDWebImageTest
//
//  Created by JL on 15/12/8.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "SDWebImageManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:@"http://gztw.oss-cn-shenzhen.aliyuncs.com/10001839020151207182213.jpg"] options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        NSLog(@"%@",[image class]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
