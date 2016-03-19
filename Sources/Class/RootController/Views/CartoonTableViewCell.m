//
//  CartoonTableViewCell.m
//  NewsReading
//
//  Created by 千锋 on 16/3/13.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "CartoonTableViewCell.h"
#import "CartoonModel.h"
@implementation CartoonTableViewCell
{
    UILabel *_headerlabel;
    UIImageView *_imageView;
    UILabel *_descLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _headerlabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 5, self.frame.size.width, 30)];
        _headerlabel.textAlignment=NSTextAlignmentCenter ;
        [self.contentView addSubview:_headerlabel];
        CGRect rect =_headerlabel.frame;
        _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)+5, self.frame.size.width, 160)];
        
        [self.contentView addSubview:_imageView];
        _descLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)+170, self.frame.size.width, 80)];
        _descLabel.numberOfLines =0;
        _descLabel.font =[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_descLabel];
        
        
    }
    return self;
}

-(void)setModel:(Cartoon *)model{
    _model =model;
    
    _headerlabel.text =model.title;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    _descLabel.text =model.digest;
    
}





- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
