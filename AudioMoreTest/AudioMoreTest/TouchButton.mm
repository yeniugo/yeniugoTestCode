//
//  TouchButton.m
//  WisdomMembersConstruction
//
//  Created by JL on 15/10/22.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "TouchButton.h"
#import <AVFoundation/AVFoundation.h>
#import "AllFilePath.h"
@interface TouchButton ()
@property (nonatomic,strong) NSDate *startDate;/**< 开始时间 */
@property (nonatomic,strong) NSDate *endDate;/**< 结束时间 */
@property (nonatomic,copy) NSString *fileName;/**< 文件名称 */
@end

@implementation TouchButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSString *)getDocumentDirectory {
    //    NSString * path = NSHomeDirectory();
    //    NSLog(@"NSHomeDirectory:%@",path);
    //    NSString * userName = NSUserName();
    //    NSString * rootPath = NSHomeDirectoryForUser(userName);
    //    NSLog(@"NSHomeDirectoryForUser:%@",rootPath);
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [NSString stringWithFormat:@"%@/myfile",documentsDirectory];
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return filePath;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSError *error;
    
    self.startDate = [NSDate date];
    NSLog(@"startData = %@",self.startDate);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //      设置日期格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *dateStr = [formatter stringFromDate:self.startDate];
    
    self.fileName = [NSString stringWithFormat:@"%@.wav",dateStr];
    NSMutableDictionary* recordSetting = [[NSMutableDictionary alloc] init];
    [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:8000.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
    [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
//    NSString *userIDStr = [[NSUserDefaults standardUserDefaults] objectForKey:UserIDkey];
    
    NSString *filePath = [AllFilePath audioWithWAVFilePath:self.fileName];
    self.recordedTmpFile = [NSURL fileURLWithPath:filePath];
//    self.recordedTmpFile = [NSURL URLWithString:filePath];
    NSLog(@"%@",filePath);
    if(self.recorder)
    {
        [self.recorder stop];
        
    }
    self.recorder = nil;
    self.recorder = [[ AVAudioRecorder alloc] initWithURL:self.recordedTmpFile settings:recordSetting error:&error];
    if (error) {
        
        NSLog(@"error = %@",error);
        return;
    }
    [self.recorder prepareToRecord];
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    //Start the actual Recording
    [self.recorder record];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.endDate = [NSDate date];
    NSLog(@"endData = %@",self.endDate);
    [self.recorder stop];
    NSTimeInterval secondsInterval= [self.endDate timeIntervalSinceDate:self.startDate];
    NSLog(@"%f",secondsInterval);
    
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.endDate = [NSDate date];
    NSLog(@"endData = %@",self.endDate);
    [self.recorder stop];
    NSTimeInterval secondsInterval= [self.endDate timeIntervalSinceDate:self.startDate];
    NSLog(@"%f",secondsInterval);
    
}

@end
