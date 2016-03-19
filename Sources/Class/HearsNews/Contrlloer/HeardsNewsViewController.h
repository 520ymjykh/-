//
//  HeardsNewsViewController.h
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeardsNewsViewController : UIViewController
@property (nonatomic, copy) NSString *urlStr;

@property (nonatomic,assign)NSUInteger currentIndex;
@property (nonatomic,copy)NSArray *photos;

@end
