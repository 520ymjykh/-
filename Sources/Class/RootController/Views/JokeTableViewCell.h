//
//  JokeTableViewCell.h
//  NewsReading
//
//  Created by 千锋 on 16/3/7.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import <UIKit/UIKit.h>
@class jokeModels,Videolists;
@interface JokeTableViewCell : UITableViewCell
@property (nonatomic,strong)jokeModels *model;
@property (nonatomic,strong)Videolists *video;
@end
