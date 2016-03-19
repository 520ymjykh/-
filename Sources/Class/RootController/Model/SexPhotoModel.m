//
//  SexPhotoModel.m
//  NewsReading
//
//  Created by 千锋 on 16/3/5.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SexPhotoModel.h"

@implementation SexPhotoModel


+ (NSDictionary *) modelCustomPropertyMapper {
    return @{ @"desc": @"description" };
}

+ (NSDictionary *)objectClassInArray{
    return @{@"newslist" : [Newslist class]};
}
@end


@implementation Newslist

@end


