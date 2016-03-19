//
//  SportsNewsViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SportsNewsViewController.h"
#import "SportModel.h"
#import "webViewViewController.h"
#import "SportTableViewCell.h"
@interface SportsNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    int _page;
}
@end
static const int starPage =1;
static const int rowsPage =20;
@implementation SportsNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    http://api.avatardata.cn/SportsNews/Query?key=6cd5b5b475834fdab0acf2590192585c&page=1&rows=10
    [self createTableView];
    
    
}
-(void)createTableView{
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 90)];
    UIImage *image =[UIImage imageNamed:@"image009.jpg"];
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
    MJRefreshAutoNormalFooter *footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadDataModel:NO];
    }];
    _tableView.header =header;
    [_tableView.header beginRefreshing];
    [header setTitle:@"正在加载数据" forState:MJRefreshStateRefreshing];
    footer.stateLabel.text = @"上拉或点击加载更多数据";
    footer.automaticallyRefresh =NO;
    _tableView.footer =footer;
    [self loadDataModel:YES];
}
-(void)loadDataModel:(BOOL)refresh{
    if (refresh) {
        _page =starPage;
    }else{
        _page +=1;
    }
    NSMutableDictionary *paramDic =[NSMutableDictionary dictionary];
    [paramDic setObject:@(_page) forKey:@"page"];
    [paramDic setObject:@(rowsPage) forKey:@"rows"];

    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.requestSerializer =[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", @"application/json", nil];
    [manager GET:@"http://api.avatardata.cn/SportsNews/Query?key=6cd5b5b475834fdab0acf2590192585c" parameters:paramDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else{
            [_dataArray removeAllObjects];
        }
        for (NSDictionary *dict in responseObject[@"result"]) {
            Result *model =[[Result alloc]init];
            [model yy_modelSetWithDictionary:dict];
            [_dataArray addObject:model];
         
        }
            dispatch_async(dispatch_get_main_queue(),
                       ^{
            [_tableView reloadData];
            
                       });
        [_tableView.header endRefreshing];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SportTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[SportTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
        
    }
    Result *modle =_dataArray[indexPath.row];

    cell.model =modle;
    cell.layer.transform =CATransform3DMakeRotation(M_PI_2, 1, 0, 0);
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:10 options:UIViewAnimationOptionLayoutSubviews animations:^{
        cell.layer.transform =CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
    }];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Result *model =_dataArray[indexPath.row];
    webViewViewController *web =[[webViewViewController alloc]init];
    
    web.url = model.url;
    [self.navigationController pushViewController:web animated:YES];
    
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
