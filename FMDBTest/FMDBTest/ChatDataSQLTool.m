//
//  ChatDataSQLTool.m
//  WisdomMembersConstruction
//
//  Created by JL on 15/12/17.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ChatDataSQLTool.h"
#import "FMDB.h"
#define WS(weakSelf)                   __weak __typeof(&*self)weakSelf = self;
@interface ChatDataSQLTool ()
@property (nonatomic,strong) FMDatabaseQueue *databaseQueue;/**< 数据库队列 */
@property (nonatomic,strong) FMDatabase *database;/**< 数据库实例 */
@property (nonatomic,copy) NSString *dataPath;/**< 数据库路径 */
@end

@implementation ChatDataSQLTool
#pragma mark - 懒加载
-(NSString *)dataPath
{
    if (_dataPath==nil) {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString * documentsDirectory = [paths objectAtIndex:0];
        _dataPath = [documentsDirectory stringByAppendingPathComponent:@"ChatData.db"];
    }
    return _dataPath;
}

-(FMDatabaseQueue *)databaseQueue
{
    if (_databaseQueue == nil) {
        _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:self.dataPath];
    }
    return _databaseQueue;
}

#pragma mark - 单例
+ (instancetype)shareInstance {
    static ChatDataSQLTool *__singletion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __singletion=[[self alloc] init];
    });
    return __singletion;
}

-(instancetype)init{
    if (self = [super init]) {
        WS(ws)
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [ws.databaseQueue inDatabase:^(FMDatabase *db) {
                /**
                 * 数据库字段说明:
                 * ID:主键，自增
                 * userID:用户ID
                 * DataType:文件类型,0未知;1图片;2音频（//TODO: 需要的时候再添加）
                 * urlStr:文件原始的URL
                 * startData:原始文件是否已经下载完成（0：未完成，1：完成）
                 * endData:数据转换是否完成（0：未完成，1：完成）
                 * 类型与satrtData,endData的关系
                 *（0）startData=0或1,endData=0
                 *（1）startData=0或1,endData=0
                 *（2）0是指amr文件，1指的是wav文件
                 */
                [db executeUpdate:@"create table IF NOT EXISTS `ChatData` (`ID` integer NOT NULL PRIMARY KEY autoincrement, userID integer,DataType int(1),urlStr varchar(255),startData int(1) default 0,endData int(1) default 0);"];
            }];
//        });
    }
    return self;
}

-(void)saveChatWithUserID:(NSString *)userID withDataType:(ChatDataSQLType)dataType withUrlStr:(NSString *)urlStr withStartData:(int)startData withEndData:(int)endData
{
    WS(ws)
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [ws.databaseQueue inDatabase:^(FMDatabase *db) {
            //TODO: 数据库新增数组
            switch (dataType) {
                case ChatDataSQLTypeNull:
                {
                    
                }
                    break;
                case ChatDataSQLTypeImage:
                {
                    FMResultSet *rs = [db executeQuery:@"select * from ChatData where urlStr = ?",urlStr];
                    if ([rs next]) {
                        [db executeUpdate:@"update into ChatData (userID,DataType,urlStr,startData,endData) values (?,1,?,?,?) where urlStr = ?",userID,urlStr,[NSNumber numberWithInt:startData],[NSNumber numberWithInt:endData],urlStr];
                    }else{
                        [db executeUpdate:@"insert into ChatData  (userID,DataType,urlStr,startData,endData) values (?,1,?,?,?)",userID,urlStr,[NSNumber numberWithInt:startData],[NSNumber numberWithInt:endData]];
                    }
                }
                    break;
                case ChatDataSQLTypeVoice:
                {
                    FMResultSet *rs = [db executeQuery:@"select * from ChatData where urlStr = ?;",urlStr];
                    if ([rs next]) {
                        [db executeUpdate:@"update into ChatData (userID,DataType,urlStr,startData,endData) values (?,1,?,?,?) where urlStr = ?;",userID,urlStr,[NSNumber numberWithInt:startData],[NSNumber numberWithInt:endData],urlStr];
                    }else{
                        [db executeUpdate:@"insert into ChatData (userID,DataType,urlStr,startData,endData) values (?,1,?,?,?);",userID,urlStr,[NSNumber numberWithInt:startData],[NSNumber numberWithInt:endData]];
                    }
                }
                    break;
                default:
                    break;
            }
//            [db executeUpdate:@""];
        }];
//    });
}
@end
