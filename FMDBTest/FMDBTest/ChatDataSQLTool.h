//
//  ChatDataSQLTool.h
//  WisdomMembersConstruction
//
//  Created by JL on 15/12/17.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, ChatDataSQLType) {
    ChatDataSQLTypeNull,
    ChatDataSQLTypeImage,
    ChatDataSQLTypeVoice,
};/**< 聊天数据下载 */
@interface ChatDataSQLTool : NSObject
+ (instancetype)shareInstance;
-(void)saveChatWithUserID:(NSString *)userID withDataType:(ChatDataSQLType)dataType withUrlStr:(NSString *)urlStr withStartData:(int)startData withEndData:(int)endData;
@end
