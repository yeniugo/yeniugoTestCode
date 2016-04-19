//
//  AllFilePath.h
//  WisdomMembersConstruction
//
//  Created by JL on 15/12/9.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllFilePath : NSObject
+(NSString *)audioWithARMFilePath;
+(NSString *)audioWithARMFilePath:(NSString *)fileName;
+(BOOL)isExitAudioWithARMFileName:(NSString *)fileName;
+(NSString *)replaceFileNameFromARMtoWAV:(NSString *)fileName;
+(NSString *)audioWithWAVFilePath;
+(NSString *)audioWithWAVFilePath:(NSString *)fileName;
+(BOOL)isExitAudioWithWAVFileName:(NSString *)fileName;
+(NSString *)replaceFileNameFromWAVtoARM:(NSString *)fileName;
@end
