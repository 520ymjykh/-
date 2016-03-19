//
//  webViewViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/4.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "webViewViewController.h"

@interface webViewViewController ()<UIWebViewDelegate>

@end

@implementation webViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *web =[[UIWebView alloc]initWithFrame:self.view.frame];
    web.delegate =self;
   
    NSURLRequest *req =[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:_url]];
    [web loadRequest:req];
    NSLog(@"%@",_url);
    
    [self.view addSubview:web];
    


}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *js =
    
    
    @"var space40 bd_top ipad_block=document.getElementsByClassName('space40 bd_top ipad_block');"
    "for(var i=0;i<space40 bd_top ipad_blockr.length;i++)"
    "{var bar = space40 bd_top ipad_block[i];"
    "bar.style.display='none'}"

    @"var ipa clearfix=document.getElementsByClassName('ipa clearfix');"
    "for(var i=0;i<ipa clearfix.length;i++)"
    "{var bar = ipa clearfix[i];"
    "bar.style.display='none'}"
   
    
    @"var  box03=document.getElementsByClassName(' box03');"
    "for(var i=0;i< box03.length;i++)"
    "{var bar =  box03[i];"
    "bar.style.display='none'}"
    
    @"var  con2 clearfix=document.getElementsByClassName(' con2 clearfix');"
    "for(var i=0;i< con2 clearfix.length;i++)"
    "{var bar =  con2 clearfix[i];"
    "bar.style.display='none'}"
    
    
    @"var  clear=document.getElementsByClassName('clear');"
    "for(var i=0;i<clear.length;i++)"
    "{var bar =clear[i];"
    "bar.style.display='none'}"

   
    @"var space10=document.getElementsByClassName('space10');"
    "for(var i=0;i< space10.length;i++)"
    "{var bar = space10[i];"
    "bar.style.display='none'}"
    
    @"var sohu_generalize_body=document.getElementsByClassName('sohu_generalize_body');"
    "for(var i=0;i<sohu_generalize_body.length;i++)"
    "{var bar =sohu_generalize_body[i];"
    "bar.style.display='none'}"
   
    
    @"var  function=document.getElementsByClassName(' function');"
    "for(var i=0;i< function.length;i++)"
    "{var bar = function[i];"
    "bar.style.display='none'}"
    
    
    @"var area.getElementsByClassName('area');"
    "for(var i=0;i<area.length;i++)"
    "{var bar = area[i];"
    "bar.style.display='none'}"
    
    @"var tagHotg.getElementsByClassName('tagHotg');"
    "for(var i=0;i<tagHotg.length;i++)"
    "{var bar = tagHotg[i];"
    "bar.style.display='none'}"
    
    
    @"var lottery-box clear.getElementsByClassName('lottery-box clear');"
    "for(var i=0;i<lottery-box clear.length;i++)"
    "{var bar = lottery-box clear[i];"
    "bar.style.display='none'}"
    
    
    @"var share clear.getElementsByClassName('share clear');"
    "for(var i=0;i<share clear.length;i++)"
    "{var bar = share clear[i];"
    "bar.style.display='none'}"
    
    @"var fade_topbar=document.getElementsByClassName('fade_topbar');"
    "for(var i=0;i<fade_topbar.length;i++)"
    "{var bar = fade_topbar[i];"
    "bar.style.display='none'}";
    
    [webView stringByEvaluatingJavaScriptFromString:js];
  
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
