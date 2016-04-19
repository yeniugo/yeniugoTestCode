//
//  TouchButton.h
//  audioTest
//
//  Created by JL on 15/10/21.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AVAudioRecorder;
@interface TouchButton : UIButton
@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) NSURL *recordedTmpFile;
@end
