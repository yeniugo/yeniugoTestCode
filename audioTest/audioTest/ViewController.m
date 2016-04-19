//
//  ViewController.m
//  audioTest
//
//  Created by JL on 15/10/21.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "TouchButton.h"
@interface ViewController ()<AVAudioRecorderDelegate>
@property (nonatomic,strong) UIButton *playButton;/**< 播放 */
@property (nonatomic,strong) TouchButton *recordButton;/**< 录音按钮 */
@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) NSURL *recordedTmpFile;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    // Do any additional setup after loading the view, typically from a nib.
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.playButton.frame = CGRectMake(100, 100, 100, 30);
    self.playButton.backgroundColor = [UIColor blueColor];
    [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
    [self.playButton setTitle:@"暂停" forState:UIControlStateSelected];
    [self.playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playButton];
    
    self.recordButton = [TouchButton buttonWithType:UIButtonTypeCustom];
    /***************    录音初始化开始     ********************/
    NSMutableDictionary* recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey:AVFormatIDKey];
    
    [recordSetting setValue:[NSNumber numberWithFloat:8000] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    [recordSetting setValue:[NSNumber numberWithInt:64] forKey:AVLinearPCMBitDepthKey];
    self.recordedTmpFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent: [NSString stringWithFormat: @"audio.%@", @"amr"]]];
    NSLog(@"Using File called: %@",self.recordedTmpFile);
    //Setup the recorder to use this file and record to it.
    NSError *error;
    self.recorder = [[ AVAudioRecorder alloc] initWithURL:self.recordedTmpFile settings:recordSetting error:&error];
    /***************    录音初始化结束     ********************/
    self.recordButton.recorder = self.recorder;
    self.recordButton.frame = CGRectMake(100, 200, 100, 30);
    self.recordButton.backgroundColor = [UIColor redColor];
    [self.recordButton setTitle:@"录音" forState:UIControlStateNormal];
    [self.recordButton setTitle:@"停止" forState:UIControlStateSelected];
//    [self.recordButton addTarget:self action:@selector(recordButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    self.recordButton.userInteractionEnabled = NO;
    [self.view addSubview:self.recordButton];
    
    //Instanciate an instance of the AVAudioSession object.
    AVAudioSession * audioSession = [AVAudioSession sharedInstance];
    //Setup the audioSession for playback and record.
    //We could just use record and then switch it to playback leter, but
    //since we are going to do both lets set it up once.
    
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: &error];
    //Activate the session
    [audioSession setActive:YES error: &error];
}

-(void)playButtonClick:(UIButton *)btn
{
    NSError *error;
    AVAudioPlayer * avPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recordedTmpFile error:&error];
    [avPlayer prepareToPlay];
    [avPlayer play];
    btn.selected = !btn.isSelected;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
