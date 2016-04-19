//
//  ViewController.m
//  GifDemo
//
//  Created by JL on 15/12/24.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+GIF.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s,home = %@",__func__,NSHomeDirectory());
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:imageView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"gif"];
//    UIImage *image = [UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfFile:path]];
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"jpg"]];
    NSLog(@"size = %@",NSStringFromCGSize(image.size));
//    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic1.ooopic.com/uploadfilepic/sheji/2008-10-14/OOOPIC_37du_2008101465a766fb36bc3533.jpg"]];
//    [SDImageCache sharedImageCache].maxCacheAge = 5;
////    [SDWebImageManager sharedManager].imageCache.maxCacheAge = 5;
////    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic1.ooopic.com/uploadfilepic/sheji/2008-10-14/OOOPIC_37du_2008101465a766fb36bc3533.jpg"]];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor redColor];
//    btn.frame = CGRectMake(0, 0, 100, 100);
//    [self.view addSubview:btn];
//    [btn  addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick:(UIButton *)btn{
    BOOL isExitFile = [[SDImageCache sharedImageCache] diskImageExistsWithKey:@"http://pic1.ooopic.com/uploadfilepic/sheji/2008-10-14/OOOPIC_37du_2008101465a766fb36bc3533.jpg"];
    NSLog(@"isExitFile = %@",isExitFile?@"YES":@"NO");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
