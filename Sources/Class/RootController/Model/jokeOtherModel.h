
//
//  jokeOtherModel.h
//  NewsReading
//
//  Created by 千锋 on 16/3/9.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class modelID,Sourceinfo,Img,Topiclist;
@interface jokeOtherModel : NSObject
@property (nonatomic, strong) modelID *BH8V39J305250057;

@end
@interface modelID : NSObject

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, strong) NSArray *link;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *apps;

@property (nonatomic, strong) NSArray *boboList;

@property (nonatomic, strong) NSArray *img;

@property (nonatomic, strong) NSArray *topiclist_news;

@property (nonatomic, strong) NSArray *ydbaike;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) BOOL picnews;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, strong) Sourceinfo *sourceinfo;

@property (nonatomic, copy) NSString *template;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, assign) BOOL hasNext;

@property (nonatomic, strong) NSArray *topiclist;

@property (nonatomic, copy) NSString *body;

@property (nonatomic, assign) NSInteger threadAgainst;

@property (nonatomic, strong) NSArray *votes;

@property (nonatomic, copy) NSString *voicecomment;

@property (nonatomic, copy) NSString *dkeys;

@property (nonatomic, strong) NSArray *users;

@property (nonatomic, assign) NSInteger threadVote;

@property (nonatomic, strong) NSArray *relative_sys;

@property (nonatomic, copy) NSString *digest;

@end

@interface Sourceinfo : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *ename;

@end

@interface Img : NSObject

@property (nonatomic, copy) NSString *pixel;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, copy) NSString *ref;

@end

@interface Topiclist : NSObject

@property (nonatomic, copy) NSString *subnum;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *cid;

@end

