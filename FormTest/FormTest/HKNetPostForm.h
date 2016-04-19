//
//  HKNetPostForm.h
//  FormTest
//
//  Created by JL on 15/4/16.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKNetPostForm : NSObject
+(void)postURL:(NSString *)url body:(NSString *)formBody success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
@end
