//
//  RootViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "RootViewController.h"
#import "RightViewController.h"

#import "AmuseNewsViewController.h"
#import "HeardsNewsViewController.h"
#import "HotsNewsViewController.h"
#import "SportsNewsViewController.h"
#import "RESideMenu.h"
#import "SearchViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width -50, 20,40, 40)];

    [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self createTabBarItem];
}
-(void)onClick{
    
    [self.sideMenuViewController presentLeftMenuViewController];
}
-(void)createTabBarItem{

    
    HeardsNewsViewController *vc =[[HeardsNewsViewController alloc]init];
    vc.title =@"头条";
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:vc];
    
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"头条" image:[[UIImage imageNamed:@"icon_star@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_star_full@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    HotsNewsViewController *hot =[[HotsNewsViewController alloc]init];
    hot.title =@"热点";
    UINavigationController *nav1 =[[UINavigationController alloc]initWithRootViewController:hot];
    
    hot.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"热点" image:[[UIImage imageNamed:@"specialcell_pk_blue_btn"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"specialcell_pk_blue_btn_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    
    SportsNewsViewController *sport =[[SportsNewsViewController alloc]init];
    sport.title =@"体育";
    UINavigationController *nav2 =[[UINavigationController alloc]initWithRootViewController:sport];
    AmuseNewsViewController *amuse =[[AmuseNewsViewController alloc]init];
    
    sport.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"体育" image:[[UIImage imageNamed:@"mission_flag_gold_empty"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"mission_flag_gold"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
        amuse.title =@"趣事";
    UINavigationController *nav3 =[[UINavigationController alloc]initWithRootViewController:amuse];
    
    amuse.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"趣事" image:[[UIImage imageNamed:@"user_set_icon_message"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"user_set_icon_game"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    SearchViewController *search =[[SearchViewController alloc]init];
    UINavigationController *nav4 =[[UINavigationController alloc]initWithRootViewController:search];
    search.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"搜索" image:[[UIImage imageNamed:@"0"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"0"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    
    NSArray *arr =@[nav,nav1,nav4,nav2,nav3];
    
    self.viewControllers =arr;
   
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
