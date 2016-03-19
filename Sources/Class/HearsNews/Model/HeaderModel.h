//
//  HeaderModel.h
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HeadApp;
@interface HeaderModel : NSObject

@end
@interface HeadApp : NSObject

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *picUrl;

@end

