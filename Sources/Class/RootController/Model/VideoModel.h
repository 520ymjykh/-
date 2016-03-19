

//
//  VideoModel.h
//  NewsReading
//
//  Created by 千锋 on 16/3/8.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Videolists,Videos;
@interface VideoModel : NSObject
@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray *videoList;

@property (nonatomic, strong) NSArray *videoSidList;
@end
@interface Videolists : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *sectiontitle;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, copy) NSString *m3u8_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, assign) NSInteger replyCount;

@end

@interface Videos : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;

@end

