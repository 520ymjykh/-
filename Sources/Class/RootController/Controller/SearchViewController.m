//
//  SearchViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/14.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SearchViewController.h"
#import "DBSphereView.h"
#import "SearchTableViewController.h"
@interface SearchViewController ()<UISearchBarDelegate>
{
    DBSphereView *dbView;
    NSString *_title;
    UISearchBar *_search;
    UIImageView *_imageView;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-65)];
    UIImage *image =[UIImage imageNamed:@"m"];
    _imageView.image =image;
    _imageView.alpha =0.5;
    [self.view addSubview:_imageView];
    
    _search =[[UISearchBar alloc]initWithFrame:CGRectMake(20, 80, self.view.frame.size.width-40, 40)];
    _search.delegate =self;
    _search.placeholder =@"请输入您要搜索的新闻";

    [self.view addSubview:_search];
      
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [self createDBSphereView];
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    SearchTableViewController *search =[SearchTableViewController new];
    search.searchText =searchBar.text;
    [self presentViewController:search animated:YES completion:nil];
    
}


-(void)createDBSphereView{
    dbView= [[DBSphereView alloc]initWithFrame:CGRectMake(-self.view.frame.size.width/2, self.view.frame.size.height/5, 600, 500)];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray *arr =@[@"美女",@"健康",@"模特",@"体育",@"北京",@"上海",@"热点",@"篮球",@"NBA",@"CBA",@"娱乐",@"明星",@"车辆",@"交通安全",@"实时动态",@"教育",@"美食",@"海报",@"军事",@"服装",@"电脑",@"科技",@"无人机",@"天气",@"酒店",@"成都妹子",@"酒吧夜店",@"科教频道",@"学习",@"精选题材",@"名胜古迹",@"道路指南",@"首饰",@"特产",@"旅游",@"医疗",@"养生",@"美容",@"减肥",@"健身",@"交友",@"营养",@"英雄联盟",@"穿越火线",@"网吧",@"小吃",@"休闲",@"头条",@"国际头条",@"国际新闻",@"国际军事",@"金融",@"股票",@"基金",@"投资",@"理财"];
    
   
    
    for (NSInteger i = 0; i <arr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:[NSString stringWithFormat:@"%@", arr[i]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:24];
        btn.frame = CGRectMake(0, 0, 100, 30);
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [dbView addSubview:btn];
   
    
}
    [dbView setCloudTags:array];
    dbView.backgroundColor = [UIColor clearColor];
     [self.view addSubview:dbView];
}
- (void)buttonPressed:(UIButton *)btn
{
    [dbView timerStop];
    
    [UIView animateWithDuration:1 animations:^{
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            btn.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            [dbView timerStart];
        }];
    }];
    NSString *srt =btn.titleLabel.text;
    
    SearchTableViewController *search =[SearchTableViewController new];
    search.searchText =srt;
    [self presentViewController:search animated:YES completion:nil];
    
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
