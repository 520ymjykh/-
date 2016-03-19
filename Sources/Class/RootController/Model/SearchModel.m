//
//  SearchModel.m
//  NewsReading
//
//  Created by 千锋 on 16/3/14.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel




+ (NSDictionary *)objectClassInArray{
    return @{@"tngou" : [searchModel class]};
}
@end


@implementation searchModel
+ (NSDictionary *) modelCustomPropertyMapper {
    return @{ @"desc": @"description" };
}
@end


