//
//  WebViewCell.h
//  UITableViewWithWebView
//
//  Created by 宇中 on 16/6/22.
//  Copyright © 2016年 LuoXingBin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WebViewCellDelegate <NSObject>

@optional
-(void)setWebViewCellHeight:(CGFloat)height;
@end

@interface WebViewCell : UITableViewCell
@property (nonatomic,weak) id<WebViewCellDelegate> delegate;/**< 代理 */
@end
