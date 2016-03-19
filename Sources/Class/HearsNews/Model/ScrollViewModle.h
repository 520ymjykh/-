

//
//  ScrollViewModle.h
//  NewsReading
//
//  Created by 千锋 on 16/3/8.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>



@class ScrollViewPhotos;
@interface ScrollViewModle : NSObject

@property (nonatomic, copy) NSString *scover;

@property (nonatomic, copy) NSString *setname;

@property (nonatomic, copy) NSString *reporter;

@property (nonatomic, copy) NSString *creator;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *clientadurl;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *postid;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, strong) NSArray *relatedids;

@property (nonatomic, copy) NSString *settag;

@property (nonatomic, copy) NSString *imgsum;

@property (nonatomic, copy) NSString *commenturl;

@property (nonatomic, strong) NSArray *photos;

@property (nonatomic, copy) NSString *tcover;

@property (nonatomic, copy) NSString *boardid;

@property (nonatomic, copy) NSString *createdate;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *autoid;

@property (nonatomic, copy) NSString *datatime;

@property (nonatomic, copy) NSString *series;

@end

@interface ScrollViewPhotos : NSObject

@property (nonatomic, copy) NSString *imgurl;

@property (nonatomic, copy) NSString *note;

@property (nonatomic, copy) NSString *photoid;

@property (nonatomic, copy) NSString *timgurl;

@property (nonatomic, copy) NSString *simgurl;

@property (nonatomic, copy) NSString *imgtitle;

@property (nonatomic, copy) NSString *cimgurl;

@property (nonatomic, copy) NSString *newsurl;

@property (nonatomic, copy) NSString *photohtml;

@property (nonatomic, copy) NSString *squareimgurl;

@end

