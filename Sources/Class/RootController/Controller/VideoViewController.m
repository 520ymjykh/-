//
//  VideoViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/8.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoModel.h"
#import "JokeTableViewCell.h"
#import "ZXVideoPlayerViewController.h"
@interface VideoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    int _page;
    int _num;
}

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"推荐视频";
    [self createTableView];
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
}
-(void)createTableView{
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 90)];
    UIImage *image =[UIImage imageNamed:@"image011.jpg"];
    imageView.image =image;
    [self.view addSubview:imageView];
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, self.view.frame.size.height-160) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.rowHeight =66;
    [self.view addSubview:_tableView];
    
    MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self loadDataModel:YES];
    }];
    [header setTitle:@"松开刷新更多数据。。。" forState:MJRefreshStatePulling];
    _tableView.header =header;
    
    MJRefreshAutoNormalFooter *footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadDataModel:NO];
    }];
    [footer setTitle:@"上拉或点击加载更多数据。。。" forState:MJRefreshStatePulling];
    _tableView.footer =footer;
    [self loadDataModel:YES];
}

-(void)loadDataModel:(BOOL)refresh{
    if (refresh) {
        _page =10;_num =0;
    }else{
        _page +=10;_num+=10;
    }
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval =10;
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json", nil];
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    NSString *url =[NSString stringWithFormat:@"http://c.3g.163.com/nc/video/home/%d-%d.html",_num,_page];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else{
            [_dataArray removeAllObjects];
        }
        
        for (NSDictionary *objDic in responseObject[@"videoList"]) {
            Videolists *model =[Videolists new];
            [model yy_modelSetWithDictionary:objDic];
            [_dataArray addObject:model];
            
        }
        [_tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JokeTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[JokeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
    }
    Videolists *model =_dataArray[indexPath.row];
    cell.video =model;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     Videolists *model =_dataArray[indexPath.row];

    
    
    ZXVideoPlayerViewController *videoVC = [[ZXVideoPlayerViewController alloc]init];
    videoVC.videoUrl =model.mp4_url;
    videoVC.imageUrl =model.cover;
    videoVC.videoTitle =model.title;
    [self presentViewController:videoVC animated:YES completion:nil];
    
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
