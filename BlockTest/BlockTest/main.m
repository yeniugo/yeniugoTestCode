//
//  main.m
//  BlockTest
//
//  Created by JL on 15/5/13.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        void (^block)();
        if(0)
        {
            block = ^{
                NSLog(@"AAAA");
            };
        }
        else
        {
            block = ^{
                NSLog(@"BBBB");
            };
        }
        block();
    }
    return 0;
}
