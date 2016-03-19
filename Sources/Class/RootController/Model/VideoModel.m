//
//  VideoModel.m
//  NewsReading
//
//  Created by 千锋 on 16/3/8.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videoList" : [Videolists class], @"videoSidList" : [Videos class]};
}

+ (NSDictionary *) modelCustomPropertyMapper {
    return @{ @"desc": @"description" };
}
@end
@implementation Videolists

@end


@implementation Videos

@end




