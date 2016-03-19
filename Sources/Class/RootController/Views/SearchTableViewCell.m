//
//  SearchTableViewCell.m
//  NewsReading
//
//  Created by 千锋 on 16/3/15.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "SearchModel.h"
@implementation SearchTableViewCell
{
    UILabel *_headerlabel;
    UIImageView *_imageView;
    UILabel *_descLabel;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 76, 56)];
        _imageView.layer.masksToBounds =YES;
        _imageView.layer.cornerRadius =15;
        [self.contentView addSubview:_imageView];
        //以imageView做参考来设置其他label
        CGRect rect =_imageView.frame;
        _headerlabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rect)+5, CGRectGetMinY(rect),self.frame.size.width-56, CGRectGetHeight(rect)/3)];
        [self.contentView addSubview:_headerlabel];
        _descLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rect)+5, CGRectGetHeight(rect)/3+10, self.frame.size.width-56, 23)];
        _descLabel.font =[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_descLabel];
        
        
    }
    return self;
}

-(void)setModel:(searchModel *)model{
    _model =model;
    
    _headerlabel.text =model.keywords;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    _descLabel.text =model.title;

}


- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
