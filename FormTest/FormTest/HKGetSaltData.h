//
//  HKGetSaltData.h
//  FormTest
//
//  Created by JL on 15/4/20.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKGetSaltData : NSObject
@property (nonatomic,assign) int nUserID;
@property (nonatomic,copy) NSString *strSalt;
@property (nonatomic,assign) int nTime;
@end
