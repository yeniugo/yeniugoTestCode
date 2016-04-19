//
//  MyDispatch.m
//  DispatchTest
//
//  Created by JL on 16/1/13.
//  Copyright © 2016年 Youths. All rights reserved.
//

#import "MyDispatch.h"

@interface MyDispatch ()
@property (nonatomic,strong) dispatch_queue_t  queue;/**< 线程 */

@end
static const void * const kDispatchQueueSpecificKey = &kDispatchQueueSpecificKey;
@implementation MyDispatch

-(instancetype)init{
    if (self = [super init]) {
        _queue = dispatch_queue_create([[NSString stringWithFormat:@"opera.%@", self] UTF8String], NULL);
        dispatch_queue_set_specific(_queue, kDispatchQueueSpecificKey, (__bridge void *)self, NULL);
    }
    return self;
}

-(void)interrupt{
    
}

-(void)dealloc{
    if (_queue) {
        _queue = 0x00;
    }
}

@end
