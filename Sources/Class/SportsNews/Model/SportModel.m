//
//  SportModel.m
//  NewsReading
//
//  Created by 千锋 on 16/3/5.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SportModel.h"

@implementation SportModel



+ (NSDictionary *)objectClassInArray{
    return @{@"result" : [Result class]};
}


//+ (NSDictionary *) modelContainerPropertyGenericClass {
//        return @{@"result" : [Result class] };
//    }

+ (NSDictionary *) modelCustomPropertyMapper {
    return @{ @"desc": @"description" };
}
@end


@implementation Result

@end


