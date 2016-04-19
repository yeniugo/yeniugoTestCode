//
//  TouchButton.h
//  WisdomMembersConstruction
//
//  Created by JL on 15/10/22.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TouchButtonDelegate <NSObject>
@optional
-(void)sendVoiceWithFileName:(NSString *)fileName withLength:(NSString *)length;
@end

@class AVAudioRecorder;
@interface TouchButton : UIButton
@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) NSURL *recordedTmpFile;
@property (nonatomic,weak) id<TouchButtonDelegate> delegate;
@end
