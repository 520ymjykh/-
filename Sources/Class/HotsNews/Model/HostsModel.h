

//
//  HostsModel.h
//  NewsReading
//
//  Created by 千锋 on 16/3/4.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class News;
@interface HostsModel : NSObject
@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray *newslist;

@property (nonatomic, assign) NSInteger code;
@end
@interface News : NSObject

@property (nonatomic, copy) NSString *picUrl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *ctime;

@end

