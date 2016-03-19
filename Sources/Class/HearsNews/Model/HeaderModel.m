//
//  HeaderModel.m
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "HeaderModel.h"

@implementation HeaderModel

//
//+ (NSDictionary *)objectClassInArray{
//    return @{@"result" : [HeadApp class]};
//}

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    
//}
//
//+ (NSDictionary *) modelContainerPropertyGenericClass {
//    return @{@"result" : [HeadApp class] };
//}

+ (NSDictionary *) modelCustomPropertyMapper {
    return @{ @"desc": @"description" };
}
@end


@implementation HeadApp

@end


