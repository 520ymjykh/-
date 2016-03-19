//
//  AmuseTableViewCell.m
//  NewsReading
//
//  Created by 千锋 on 16/3/8.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "AmuseTableViewCell.h"
#import "AmuseModel.h"
@implementation AmuseTableViewCell
{
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_spaceLabel;
    UILabel *_timeLable;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 76, 56)];
        _imageView.layer.masksToBounds =YES;
        _imageView.layer.cornerRadius =15;
        [self.contentView addSubview:_imageView];
        //以imageView做参考来设置其他label
        CGRect rect =_imageView.frame;
        _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rect)+5, CGRectGetMinY(rect),self.frame.size.width-56, CGRectGetHeight(rect)/3)];
        [self.contentView addSubview:_titleLabel];
        _spaceLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rect)+5, CGRectGetHeight(rect)/3+10, 60, 23)];
        _spaceLabel.text =@"更新时间:";
        _spaceLabel.font =[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_spaceLabel];
        _timeLable =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rect)+65, CGRectGetHeight(rect)/3+10, self.frame.size.width-56, 23)];
        _timeLable.font =[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_timeLable];
        
        
    }
    return self;
}
-(void)setModel:(Results *)model{
    _model =model;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"image004.jpg"]];
    _titleLabel.text =model.title;
    _timeLable.text =model.ctime;
    
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
