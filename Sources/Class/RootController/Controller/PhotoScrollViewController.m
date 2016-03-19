//
//  PhotoScrollViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/10.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "PhotoScrollViewController.h"
#import "SexPhotoModel.h"
@interface PhotoScrollViewController ()
{
    UIImageView *_imageView;
    
    
}

@end

@implementation PhotoScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    self.title =@"性感美图";
    
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 30, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UIButton *cancleButton =[[UIButton alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height-80, 120, 40)];
    [cancleButton addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [cancleButton setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:cancleButton];
    
    UIButton *okButton =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, self.view.frame.size.height-80, 100, 40)];
    [okButton addTarget:self action:@selector(preservePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [okButton setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okButton setTitle:@"保存到相册" forState:UIControlStateNormal];
    [self.view addSubview:okButton];
    
    
    _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(5, 100, self.view.frame.size.width-10, self.view.frame.size.height-200)];
     [_imageView sd_setImageWithURL:[NSURL URLWithString:_picUrl]placeholderImage:[UIImage imageNamed:@"image005"]];
    [self.view addSubview:_imageView];
    


}


-(void)preservePhoto:(UIButton *)sender{
    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"保存图片到相册" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *save =[UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UIImageWriteToSavedPhotosAlbum(_imageView.image, nil, nil, nil);
        
    }];
    UIAlertAction *cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:save];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];

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
