//
//  OtherTableViewCell.m
//  NewsReading
//
//  Created by 千锋 on 16/3/9.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "OtherTableViewCell.h"
#import "OtherPhotoModel.h"
@implementation OtherTableViewCell
{
    UIImageView *_headerView;
    UILabel *_headerlabel;
    UIImageView *_imageView;
    UILabel *_descLabel;
    UILabel *_footerLabel;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _headerView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 30, 30)];
        _headerView.layer.masksToBounds =YES;
        _headerView.layer.cornerRadius =15;
        [self.contentView addSubview:_headerView];
        //以第一视图做其他的参考
        CGRect rect =_headerView.frame;
        _headerlabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rect)+5, CGRectGetMinY(rect), self.frame.size.width, 30)];
        [self.contentView addSubview:_headerlabel];
        
        _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)+5, self.frame.size.width, 160)];
        
        [self.contentView addSubview:_imageView];
        _descLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)+170, self.frame.size.width, 80)];
        _descLabel.numberOfLines =0;
        [self.contentView addSubview:_descLabel];
        _footerLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMidX(rect), CGRectGetMaxY(rect)+240, self.frame.size.width, 30)];
        [self.contentView addSubview:_footerLabel];
        
        
    }
    return self;
}

-(void)setModel:(Expertlists *)model{
    _model =model;
    [_headerView sd_setImageWithURL:[NSURL URLWithString:model.headpicurl]];
    _headerlabel.text =[NSString stringWithFormat:@"%@/%@",model.name,model.title];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.picurl]];
    
    _descLabel.text =model.desc;
    
    _footerLabel.text =[NSString stringWithFormat:@"来自:%@ %ld次关注 %ld次提问",model.classification,(long)model.concernCount,(long)model.questionCount];
    _footerLabel.font =[UIFont systemFontOfSize:14];
    

    
    
    
}












- (void)awakeFromNib {
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
