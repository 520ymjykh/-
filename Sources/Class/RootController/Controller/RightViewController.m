//
//  RightViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "RightViewController.h"
#import "SexPhotosViewController.h"
#import "OtherPhotoViewController.h"
#import "JokeViewController.h"
#import "VideoViewController.h"
#import "OurViewController.h"
#import "CartoonViewController.h"
#import "SearchViewController.h"
@interface RightViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy)UITableView *tableView;
@property (nonatomic,assign)NSMutableArray *dataArray;



@end

@implementation RightViewController
{
    UIImageView *_imageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    

    _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 190, self.view.frame.size.height)];
    UIImage *bImage =[UIImage imageNamed:@"l.jpg"];
    _imageView.image =bImage;
   
    [self.view addSubview:_imageView];

    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(40, 40, 100, 100)];
    UIImage *image =[UIImage imageNamed:@"sss"];
    imageView.image =image;
    [self.view addSubview:imageView];

    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 140, 190, 300) style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    
    [self.view addSubview:_tableView];
    
   
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
    }
    cell.backgroundColor =[UIColor groupTableViewBackgroundColor];
    cell.textLabel.text = @[@"性感美图", @"知名人士", @"视频推荐", @"特别推荐",@"精选漫画",@"特别搜索",@"关于我们"][indexPath.row];
    cell.imageView.image =[UIImage imageNamed:@[@"4",@"2",@"3",@"1",@"6",@"11",@"5"][indexPath.row]] ;
    return cell;
    

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        SexPhotosViewController *sex =[[SexPhotosViewController alloc]init];
        
        [self presentViewController:sex animated:YES completion:nil];
    }
    
    if (indexPath.row ==1) {
        OtherPhotoViewController *other =[[OtherPhotoViewController alloc]init];
       
        [self presentViewController:other animated:YES completion:nil];
    }
    if (indexPath.row ==2) {
        VideoViewController *video =[[VideoViewController alloc]init];
        
        [self presentViewController:video animated:YES completion:nil];
    }

    
    if (indexPath.row ==3) {
        JokeViewController *joke =[[JokeViewController alloc]init];
        
        [self presentViewController:joke animated:YES completion:nil];
    }
    
    if (indexPath.row ==4) {
        CartoonViewController *cartoonView =[[CartoonViewController alloc]init];
        
        [self presentViewController:cartoonView animated:YES completion:nil];
        
    }
    if (indexPath.row ==6) {
        OurViewController *ourView =[[OurViewController alloc]init];
        
        [self presentViewController:ourView animated:YES completion:nil];
        
    }
    if (indexPath.row ==5) {
       SearchViewController *search =[[SearchViewController alloc]init];
        
        [self presentViewController:search animated:YES completion:nil];
        
    }


    
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
