//
//  AllFilePath.m
//  WisdomMembersConstruction
//
//  Created by JL on 15/12/9.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "AllFilePath.h"

@implementation AllFilePath
+(NSString *)audioWithARMFilePath
{
    NSString *temp = NSTemporaryDirectory();
    NSString *armPath = [temp stringByAppendingPathComponent:@"arm"];
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:armPath isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:armPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return armPath;
}

+(NSString *)audioWithARMFilePath:(NSString *)fileName
{
    NSString *pathStr = [AllFilePath audioWithARMFilePath];
    NSString *filePath = [pathStr stringByAppendingPathComponent:fileName];
    return filePath;
}

+(BOOL)isExitAudioWithARMFileName:(NSString *)fileName
{
    NSString *filePath = [AllFilePath audioWithARMFilePath:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    if (isDir == NO && existed == YES){
        return YES;
    }else{
        return NO;
    }
}

+(NSString *)replaceFileNameFromARMtoWAV:(NSString *)fileName
{
    NSRange range = NSMakeRange(fileName.length-3, 3);
    NSString *replaceStr = [fileName stringByReplacingCharactersInRange:range withString:@"wav"];
    return replaceStr;
}

+(NSString *)audioWithWAVFilePath
{
    NSString *temp = NSTemporaryDirectory();
    NSString *wavPath = [temp stringByAppendingPathComponent:@"wav"];
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:wavPath isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:wavPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return wavPath;
}

+(NSString *)audioWithWAVFilePath:(NSString *)fileName
{
    NSString *pathStr = [AllFilePath audioWithWAVFilePath];
    NSString *filePath = [pathStr stringByAppendingPathComponent:fileName];
    return filePath;
}

+(BOOL)isExitAudioWithWAVFileName:(NSString *)fileName
{
    NSString *filePath = [AllFilePath audioWithWAVFilePath:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    if (isDir == NO && existed == YES){
        return YES;
    }else{
        return NO;
    }
}

+(NSString *)replaceFileNameFromWAVtoARM:(NSString *)fileName
{
    NSRange range = NSMakeRange(fileName.length-3, 3);
    NSString *replaceStr = [fileName stringByReplacingCharactersInRange:range withString:@"amr"];
    return replaceStr;
}

@end
