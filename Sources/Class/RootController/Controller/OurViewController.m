//
//  OurViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/12.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "OurViewController.h"

@interface OurViewController ()

@end

@implementation OurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"关于我们";
    self.view.backgroundColor =[UIColor grayColor];
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];

    
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 190, self.view.frame.size.width, self.view.frame.size.height-190)];
    UIImage *image =[UIImage imageNamed:@"news2.jpg"];
    imageView.image =image;
    [self.view addSubview:imageView];
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(10, 64, self.view.frame.size.width-20,120)];
    label.text =@"这是一款新闻阅读类的APP，该APP可以让您尽情阅读国内实时动态。该App涵盖了：国内外头条热点、体育消息和趣事怪闻。也可以让您观赏美图动画，推荐视频等。这是可以让您激情沸腾的App，您值得体验。谢谢";
    label.numberOfLines =0;
    label.textColor =[UIColor redColor];
    
    [self.view addSubview:label];
    
    
    
    UIImageView *view =[[UIImageView alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height-80, 30, 60)];
    UIImage *image1 =[UIImage imageNamed:@"share"];
    view.image =image1;
    [self.view addSubview:view];
    
    UIButton *enterBtn =[[UIButton alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height-80, self.view.frame.size.width-80, 60)];
    [enterBtn setTitle:@"轻轻点击便可微博互联..." forState:UIControlStateNormal];
    enterBtn.titleLabel.font =[UIFont systemFontOfSize:22];
    enterBtn.backgroundColor =[UIColor clearColor];
    [enterBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [enterBtn setTintColor:[UIColor redColor]];
    [enterBtn addTarget:self action:@selector(enterWeiBo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enterBtn];
    
    
    
}
-(void)enterWeiBo:(UIButton *)sender{
    
   
    NSString *url =@"http://weibo.com/865022218AQing";
    
     [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url relativeToURL:nil]];
                             
}
-(void)onClick{
    [self dismissViewControllerAnimated:YES completion:nil];
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
