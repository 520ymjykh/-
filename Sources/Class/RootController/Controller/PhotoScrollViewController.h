//
//  PhotoScrollViewController.h
//  NewsReading
//
//  Created by 千锋 on 16/3/10.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollViewController : UIViewController
@property (nonatomic,copy)NSString *picUrl;
@property (nonatomic,assign)NSUInteger currentIndex;
@property (nonatomic,copy)NSArray *photos;
@end
