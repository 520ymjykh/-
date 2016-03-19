

//
//  CartoonModel.h
//  NewsReading
//
//  Created by 千锋 on 16/3/13.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Cartoon;
@interface CartoonModel : NSObject
@property (nonatomic, strong) NSArray *T1451370429008;
@end
@interface Cartoon : NSObject

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *url_3w;

@property (nonatomic, copy) NSString *postid;

@property (nonatomic, assign) NSInteger hasHead;

@property (nonatomic, assign) NSInteger hasImg;

@property (nonatomic, copy) NSString *lmodify;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *pixel;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *cid;

@property (nonatomic, copy) NSString *template;

@property (nonatomic, assign) NSInteger votecount;

@property (nonatomic, copy) NSString *ltitle;

@property (nonatomic, assign) BOOL hasIcon;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *boardid;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, copy) NSString *digest;

@end

