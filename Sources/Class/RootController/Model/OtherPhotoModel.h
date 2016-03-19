
//
//  OtherPhotoModel.h
//  NewsReading
//
//  Created by 千锋 on 16/3/6.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>


@class DataModel,Expertlists;
@interface OtherPhotoModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DataModel *data;

@property (nonatomic, assign) NSInteger code;

@end

@interface DataModel : NSObject
@property (nonatomic, strong) NSArray *expertList;


@end

@interface Expertlists : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *classification;

@property (nonatomic, assign) NSInteger questionCount;

@property (nonatomic, assign) NSInteger concernCount;

@property (nonatomic, assign) NSInteger expertState;

@property (nonatomic, copy) NSString *picurl;

@property (nonatomic, assign) NSInteger state;

@property (nonatomic, copy) NSString *headpicurl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger answerCount;

@property (nonatomic, assign) long long createTime;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *stitle;

@property (nonatomic, copy) NSString *expertId;

@property (nonatomic, copy) NSString *name;

@end

