//
//  SportModel.h
//  NewsReading
//
//  Created by 千锋 on 16/3/5.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Result;
@interface SportModel : NSObject
@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) NSArray *result;

@property (nonatomic, copy) NSString *reason;

@end

@interface Result : NSObject

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *picUrl;

@end

