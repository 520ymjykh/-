//
//  JokeView.m
//  NewsReading
//
//  Created by 千锋 on 16/3/10.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "JokeView.h"
#import "JokeModel.h"
#import "UMSocial.h"
#import "YLImageView.h"
#import "YLGIFImage.h"
@interface JokeView ()

@end

@implementation JokeView
{
    UILabel *_titleLable;
    
   YLImageView *_imageView;
    
    UILabel *_footLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 30, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UIButton *shareBtn =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-80, 30, 60, 40)];
    [shareBtn addTarget:self action:@selector(shareUM:) forControlEvents:UIControlEventTouchUpInside];
    
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    
    [self.view addSubview:shareBtn];
    


    _titleLable =[[UILabel alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 80)];
    _titleLable.text =_model.title;
    _titleLable.numberOfLines =0;
    [self.view addSubview:_titleLable];
    _imageView =[[YLImageView alloc]initWithFrame:CGRectMake(6, 160, self.view.frame.size.width-12, 200)];
    
   [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:_model.imgsrc] options:SDWebImageDownloaderProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
       
   } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
       _imageView.image = [YLGIFImage imageWithData:data];
   }];
    [self.view addSubview:_imageView];
    _footLabel =[[UILabel alloc]initWithFrame:CGRectMake(6, 360, self.view.frame.size.width-12, 120)];
    _footLabel.text=_model.digest;
    _footLabel.numberOfLines =0;

    [self.view addSubview:_footLabel];
    
    
    
}

-(void)onClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)shareUM:(UIButton*)btn{
    UIImageView *shareImage =[UIImageView new];
    [shareImage sd_setImageWithURL:[NSURL URLWithString:_model.imgsrc]];
    
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"56e3ad8be0f55a17260011a9" shareText:[NSString stringWithFormat:@"%@_%@",_model.title,_model.imgsrc] shareImage: shareImage shareToSnsNames:[NSArray arrayWithObjects:UMShareToRenren,UMShareToSina,UMShareToTencent,UMShareToTumblr,UMShareToQQ,UMShareToSms,UMShareToPinterest, nil]  delegate:nil];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
