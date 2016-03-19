//
//  CartoonWebViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/13.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "CartoonWebViewController.h"

@interface CartoonWebViewController ()<UIWebViewDelegate>

@end

@implementation CartoonWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *web =[[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    web.delegate =self;
    
    NSURLRequest *req =[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:_url]];
    [web loadRequest:req];
    
    [self.view addSubview:web];
    
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
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
