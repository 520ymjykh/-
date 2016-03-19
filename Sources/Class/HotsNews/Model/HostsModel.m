//
//  HostsModel.m
//  NewsReading
//
//  Created by 千锋 on 16/3/4.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "HostsModel.h"

@implementation HostsModel


+ (NSDictionary *)objectClassInArray{
    return @{@"newslist" : [News class]};
}

+ (NSDictionary *) modelCustomPropertyMapper {
    return @{ @"desc": @"description", @"ctime": @"hottime"};
}
@end
@implementation News

@end


