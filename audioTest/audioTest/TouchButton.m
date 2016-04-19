//
//  TouchButton.m
//  audioTest
//
//  Created by JL on 15/10/21.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "TouchButton.h"
#import <AVFoundation/AVFoundation.h>

@interface TouchButton ()
@property (nonatomic,strong) NSDate *startDate;/**< 开始时间 */
@property (nonatomic,strong) NSDate *endDate;/**< 结束时间 */
@end

@implementation TouchButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.startDate = [NSDate date];
    NSLog(@"startData = %@",self.startDate);
    [self.recorder stop];
    //Now that we have our settings we are going to instanciate an instance of our recorder instance.
    //Generate a temp file for use by the recording.
    //This sample was one I found online and seems to be a good choice for making a tmp file that
    //will not overwrite an existing one.
    //I know this is a mess of collapsed things into 1 call.  I can break it out if need be.
    
    //Use the recorder to start the recording.
    //Im not sure why we set the delegate to self yet.
    //Found this in antother example, but Im fuzzy on this still.
//    [self.recorder setDelegate:self];
    //We call this to start the recording process and initialize
    //the subsstems so that when we actually say "record" it starts right away.
    [self.recorder prepareToRecord];
    //Start the actual Recording
    [self.recorder record];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.endDate = [NSDate date];
    NSLog(@"endData = %@",self.endDate);
    [self.recorder stop];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.endDate = [NSDate date];
    NSLog(@"endData = %@",self.endDate);
    [self.recorder stop];
}

@end
