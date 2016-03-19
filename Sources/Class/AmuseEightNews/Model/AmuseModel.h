

//
//  AmuseModel.h
//  NewsReading
//
//  Created by 千锋 on 16/3/6.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Results;
@interface AmuseModel : NSObject
@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) NSArray *result;

@property (nonatomic, copy) NSString *reason;
@end
@interface Results : NSObject

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *picUrl;

@end

