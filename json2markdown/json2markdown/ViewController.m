//
//  ViewController.m
//  json2markdown
//
//  Created by JL on 15/10/10.
//  Copyright (c) 2015年 Youths. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "ListModel.h"
#import "ListData.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *jsonStr = @"{list: [\
    {name:'sstoolkit',          owner:'soffes',          desc:'一套Category类型的库,附带很多自定义控件 功能不错～'},\
    {name:'BFKit',              owner:'FabrizioBrancati',desc:'又一套Category类型的 Kit，还有几个工具类'},\
    {name:'APUtils',            owner:'andrei512',       desc:'又一套Category类型的 Kit'},\
    {name:'QSKit',              owner:'quartermaster',   desc:'又一套Category类型的 Kit'},\
    {name:'iOS-Categories',     owner:'shaojiankui',     desc:'又一套Category类型的 Kit'},\
    {name:'BlocksKit',          owner:'zwaldowski',      desc:'将Block风格带入UIKit和Founcation'},\
    {name:'cocoa-helpers',      owner:'enormego',        desc:'一些Cocoa的扩展 2年前的工程'},\
    {name:'iOS-NBUKit',         owner:'CyberAgent',      desc:'一套基础工具库'},\
    {name:'CoconutKit',         owner:'defagos',         desc:'一系列扩展和一些自定组件'},\
    {name:'STUtils',            owner:'ldandersen',      desc:'一系列扩展包'},\
    {name:'PSFoundation',       owner:'steipete',        desc:'一系列扩展 和功能增强'},\
    {name:'ConciseKit',         owner:'petejkim',        desc:'一系列宏定义 挺有意思'},\
    {name:'DTFoundation',       owner:'Cocoanetics',     desc:'又一系列扩展。。。'},\
    {name:'BBBootstrap',        owner:'brunodecarvalho', desc:'一些常见功能的扩展库'},\
    {name:'Objective-Shorthand',owner:'khanlou',         desc:'将长方法简化的Category'},\
    {name:'BGUtilities',        owner:'bennyguitar',     desc:'几个简单好用的Cagegory'},\
    {name:'cooliris-toolkit',   owner:'mave99a',         desc:'cooliris出品的基础工具库,从GoogleCode clone过来'},\
    {name:'BaseKit',            owner:'brunow',          desc:'一套基础工具库'},\
    {name:'NSObject-Utility-Categories', owner:'erica',  desc:'如题'},\
    {name:'NSArray-Utilities',  owner:'erica',           desc:'如题'},\
    {name:'aqtoolkit',          owner:'AlanQuatermain',  desc:'一些常用的东西'},\
    {name:'DLIntrospection',    owner:'garnett',         desc:'一些NSObject的扩展'},\
    {name:'YOLOKit',            owner:'mxcl',            desc:'一些方便的快速枚举方法'},\
    {name:'NSDate-Extensions',  owner:'erica',           desc:'如题日期'},\
    {name:'ALActionBlocks',     owner:'lavoy',           desc:'在UIControl上添加的Block事件'},\
    {name:'jrswizzle',          owner:'rentzsch',        desc:'主要是swizzling'},\
    {name:'moriarty',           owner:'tylerneylon',     desc:'一些还算有用的功能'},\
    {name:'QSUtilities',        owner:'mikeho',          desc:'一些基础库 (Instagram有用到)'},\
    {name:'libextobjc',         owner:'jspahrsummers',   desc:'一堆oc的扩展'},\
    {name:'PrettyTimestamp',    owner:'jonhocking',      desc:'友好时间的扩展'},\
    {name:'DateTools',          owner:'MatthewYork',     desc:'不错的时间处理相关的工具箱'},\
    {name:'ios-jail-break-detector',    owner:'diwu',    desc:'检测是否越狱 有上线'},\
    {name:'crackify',           owner:'itruf',           desc:'检测App是否被破解'},\
    {name:'UIView-AnimatedProperty',owner:'iMartinKiss', desc:'为UIView添加动画效果的property,有用到swizzle'},\
    {name:'UIView-Positioning', owner:'freak4pc',        desc:'为UIView的frame等添加更多属性，方便设置view'},\
    {name:'Block-KVO',          owner:'iMartinKiss',     desc:'Block风格的KVO~'},\
    {name:'MTDates',          owner:'mysterioustrousers',desc:'一些Data的category'},\
    {name:'CocoaSecurity',      owner:'kelp404',         desc:'常见的哈希、加密解密算法'},\
    {name:'FCFileManager',      owner:'fabiocaccamo',    desc:'更好更方便的访问文件和文件夹'},\
    {name:'sskeychain',         owner:'soffes',          desc:'访问keychain 支持iOS Mac'},\
    {name:'UISS',               owner:'robertwijas',     desc:'用JSON的风格设置UIKit样式'},\
    {name:'Underscore.m',       owner:'robb',            desc:'仿JS的underscore.js来写的,用于访问和处理数据'},\
    {name:'TICoreDataSync',     owner:'nothirst',        desc:'在不同设备间对CoreData进行同步 (iPhone iPad Mac)'},\
    {name:'SoloComponents-iOS', owner:'andreyvit',       desc:'几个轻量的组件,没什么用,2年没更新'},\
    {name:'MAObjCRuntime',      owner:'mikeash',         desc:'将运行时包装成ObjC'},\
    {name:'Objective-C-Generics',owner:'tomersh',        desc:'通过宏定义勉强实现的范型'},\
    {name:'TBMacros',           owner:'twobitlabs',      desc:'一些常用的宏定义'},\
    {name:'NSString-Ruby',      owner:'zdavison',        desc:'为Ruby程序员带来的字符串相关功能'},\
    {name:'ObjectiveRecord',    owner:'supermarin',      desc:'CoreData包装的活动记录 有RoR风格的API'}\
    ]\
}";
    [ListModel setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"listModel" : @"ListData",
                 
                 };
    }];
    ListModel *listModel = [ListModel objectWithKeyValues:jsonStr];
    NSMutableString *lastStr = [NSMutableString string];
    for (ListData *listData in listModel.list) {
        NSLog(@"%@",listData.name);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
