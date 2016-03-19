//
//  OtherPhotoModel.m
//  NewsReading
//
//  Created by 千锋 on 16/3/6.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "OtherPhotoModel.h"

@implementation OtherPhotoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"expertList" : [Expertlists class]};
}

@end
@implementation DataModel

@end


@implementation Expertlists
+ (NSDictionary *) modelCustomPropertyMapper {
    return @{ @"desc": @"description" };
}
@end


