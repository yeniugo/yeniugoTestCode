//
//  HKGetSalt.h
//  FormTest
//
//  Created by JL on 15/4/20.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class HKGetSaltData;
#import "HKGetSaltData.h"
@interface HKGetSalt : NSObject
@property (nonatomic,assign) int nFlag;
@property (nonatomic,copy) NSString *strError;
@property (nonatomic,strong) HKGetSaltData *Data;
@end
