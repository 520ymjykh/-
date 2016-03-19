//
//  JokeTableViewCell.m
//  NewsReading
//
//  Created by 千锋 on 16/3/7.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "JokeTableViewCell.h"
#import "JokeModel.h"
#import "VideoModel.h"
#import "YLImageView.h"
#import "YLGIFImage.h"
@implementation JokeTableViewCell
{

    YLImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_timeLable;
}
- (void)awakeFromNib {
   
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imageView =[[YLImageView alloc]initWithFrame:CGRectMake(10, 5, 76, 56)];
        _imageView.layer.masksToBounds =YES;
        _imageView.layer.cornerRadius =15;
        [self.contentView addSubview:_imageView];
        //以imageView做参考来设置其他label
        CGRect rect =_imageView.frame;
        _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rect)+5, CGRectGetMinY(rect),self.frame.size.width-56, CGRectGetHeight(rect)/3)];
        [self.contentView addSubview:_titleLabel];
        _timeLable =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rect)+5, CGRectGetHeight(rect)/3+10, self.frame.size.width-56, 23)];
        [self.contentView addSubview:_timeLable];
        
        
    }
    return self;
}
-(void)setModel:(jokeModels *)model{
    _model =model;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        YLGIFImage *sImage = [YLGIFImage imageWithData:UIImagePNGRepresentation(image)];
//        _imageView.image = [sImage getFrameWithIndex:0];
        UIImage *sImage = [UIImage imageWithData:UIImagePNGRepresentation(_imageView.image)];
        _imageView.image = sImage;
        
    }];
    _titleLabel.text =model.title;
    _timeLable.text =model.ptime;
    
}

-(void)setVideo:(Videolists *)video{
    
    _video =video;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:video.cover] placeholderImage:[UIImage imageNamed:@"image007.jpg"]];
    _titleLabel.text =video.title;
    _timeLable.text =video.ptime;
    
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
