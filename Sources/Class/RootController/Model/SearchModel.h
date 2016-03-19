//
//  SearchModel.h
//  NewsReading
//
//  Created by 千锋 on 16/3/14.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>


@class searchModel;
@interface SearchModel : NSObject

@property (nonatomic, assign) BOOL status;

@property (nonatomic, strong) NSArray *tngou;

@property (nonatomic, assign) NSInteger total;

@end

@interface searchModel : NSObject

@property (nonatomic, assign) NSInteger fcount;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, assign) NSInteger rcount;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) long long time;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger topclass;

@end

