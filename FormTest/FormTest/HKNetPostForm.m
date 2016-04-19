//
//  HKNetPostForm.m
//  FormTest
//
//  Created by JL on 15/4/16.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "HKNetPostForm.h"
#import "AFNetworking.h"

#define ACTION_TIMEOUT 2

@implementation HKNetPostForm
+(void)postURL:(NSString *)url body:(NSString *)formBody success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setTimeoutInterval:ACTION_TIMEOUT];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSString *dateStr = [NSString stringWithFormat:@"%lld",(long long)date.timeIntervalSince1970];
    NSLog(@"%@",dateStr);
    [request setValue:dateStr forHTTPHeaderField:@"TIME"];
    request.HTTPBody=[formBody dataUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (error.code != NSURLErrorTimedOut) {
            NSLog(@"error: %@", error);
        }
        failure(error);
    }];
    
    [operation start];
}
@end
