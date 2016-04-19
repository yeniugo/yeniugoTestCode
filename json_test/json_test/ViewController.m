//
//  ViewController.m
//  json_test
//
//  Created by JL on 15/7/10.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#define WS(weakSelf)                   __weak __typeof(&*self)weakSelf = self;
@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView    *webView;
@property (nonatomic, strong,readonly) JSContext    *jsContext;
@end

@implementation ViewController

-(UIWebView *)webView
{
    if (_webView==nil) {
        _webView = [[UIWebView alloc] init];
        _webView.frame = CGRectMake(0, 20, 200, 300);
        _webView.delegate = self;
        NSString *basePath = [[NSBundle mainBundle]bundlePath];
        NSString *helpHtmlPath;
        helpHtmlPath = [basePath stringByAppendingPathComponent:@"test.html"];
//        helpHtmlPath = @"http://gqtech-test.wareton.com/html_test.html";
        NSURL *url;
//        url = [NSURL fileURLWithPath:helpHtmlPath];
        url = [NSURL URLWithString:helpHtmlPath];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        [self.view addSubview:_webView];
        
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    _jsContext = nil;
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    WS(ws);
    if (_jsContext==nil) {
        // 1.
        _jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        
        // 2. 关联打印异常
        _jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
            context.exception = exceptionValue;
            NSLog(@"异常信息：%@", exceptionValue);
        };
        
        _jsContext[@"abc.activityList"] = ^(NSString *param) {
//            JSValue *function = ws.jsContext[@"testClick"];
//            [function callWithArguments:@[@"abc"]];
            NSLog(@"activityList , %@ ,%@",param,[NSNumber numberWithInt:5]);
        };
        
        // Mozilla/5.0 (iPhone; CPU iPhone OS 10_10 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411
        id userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
        NSLog(@"%@", userAgent);
    }
}

//- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
//{
//    NSString *urlString = [[request URL] absoluteString];
//    urlString = [urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"urlString=%@",urlString);
//    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
//    
//    if([urlComps count] && [[urlComps objectAtIndex:0] isEqualToString:@"objc"])
//    {
//        
//        NSArray *arrFucnameAndParameter = [(NSString*)[urlComps objectAtIndex:1] componentsSeparatedByString:@":/"];
//        NSString *funcStr = [arrFucnameAndParameter objectAtIndex:0];
//        
//        if (1 == [arrFucnameAndParameter count])
//        {
//            // 没有参数
//            if([funcStr isEqualToString:@"doFunc1"])
//            {
//                
//                /*调用本地函数1*/
//                NSLog(@"doFunc1");
//                
//            }
//        }
//        else
//        {
//            //有参数的
//            if([funcStr isEqualToString:@"getParam1:withParam2:"])
//            {
//                [self getParam1:[arrFucnameAndParameter objectAtIndex:1] withParam2:[arrFucnameAndParameter objectAtIndex:2]];
//            }
//        }
//        return NO;
//    }
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
