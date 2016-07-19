//
//  WebViewCell.m
//  UITableViewWithWebView
//
//  Created by 宇中 on 16/6/22.
//  Copyright © 2016年 LuoXingBin. All rights reserved.
//

#import "WebViewCell.h"
#import "masonry.h"
@interface WebViewCell ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;/**< webView */
@end

@implementation WebViewCell



-(UIWebView *)webView{
    if (_webView == nil) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
        [self.contentView addSubview:_webView];
        __weak typeof(self) weakSelf = self;
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.contentView);
        }];
        _webView.delegate = self;
    }
    return _webView;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    [webView sizeToFit];
//    webView.scrollView.contentSize.height;
//    CGFloat w = [UIScreen mainScreen].bounds.size.width;
//    self.webView.frame = CGRectMake(0, 0, w, webView.scrollView.contentSize.height);
    //获取页面高度（像素）
//    CGFloat webViewHeight=[webView.scrollView contentSize].height;
//    CGRect newFrame = webView.frame;
//    newFrame.size.height = webViewHeight;
//    webView.frame = newFrame;
    webView.scrollView.scrollEnabled = NO;
//    if ([self.delegate respondsToSelector:@selector(setWebViewCellHeight:)]) {
//        [self.delegate setWebViewCellHeight:webViewHeight];
//    }
    CGFloat height = [[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    NSLog(@"%f",height);
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.frame = CGRectMake(0, 0, w, h);
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"%@",self);
}

@end
