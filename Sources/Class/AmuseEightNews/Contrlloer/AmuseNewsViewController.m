//
//  AmuseNewsViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "AmuseNewsViewController.h"
#import "AmuseModel.h"
#import "webViewViewController.h"
#import "AmuseTableViewCell.h"
@interface AmuseNewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    int _page;
    
}
@end
static const int starPage =1;
static const int rowsPage =20;
@implementation AmuseNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    
    
}
-(void)createTableView{
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 90)];
    UIImage *image =[UIImage imageNamed:@"image006.jpg"];
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
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    _tableView.header =header;
    MJRefreshAutoNormalFooter *footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [self loadDataModel:NO];
    }];
    footer.stateLabel.text =@"点击或上拉刷新更多数据。。。";
    _tableView.footer =footer;
    [self loadDataModel:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   AmuseTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        
        cell =[[AmuseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
    }
    Results *model =_dataArray[indexPath.row];

    cell.model =model;
    cell.layer.transform =CATransform3DMakeRotation(M_PI_2, 1, 0, 0);
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:10 options:UIViewAnimationOptionLayoutSubviews animations:^{
        cell.layer.transform =CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
    }];

    
    return cell;
}

-(void)loadDataModel:(BOOL)refresh
{    if (refresh) {
        _page =starPage;
    }else{
        _page +=1;
    }
    NSMutableDictionary *paramDic =[NSMutableDictionary dictionary];
    [paramDic setObject:@(_page) forKey:@"page"];
    [paramDic setObject:@(rowsPage) forKey:@"rows"];
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval =10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
   
    [manager GET:@"http://api.avatardata.cn/QiWenNews/Query?key=b0dc9521e38142549e7afb903f338671" parameters:paramDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else if (refresh){
            [_dataArray removeAllObjects];
        }
       
        for (NSDictionary *objDic in responseObject[@"result"]) {
            Results *model =[[Results alloc]init];
            [model yy_modelSetWithDictionary:objDic];
            [_dataArray addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [_tableView reloadData];
                       });
        [self  endRefreshing];
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        _page -=1;
        [self endRefreshing];
        NSLog(@"%@",error);
        
    }];
    
}

- (void) endRefreshing {
    if (_tableView.header.isRefreshing) {
        [_tableView.header endRefreshing];
    }
    
    if (_tableView.footer.isRefreshing) {
        [_tableView.footer endRefreshing];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Results *model =_dataArray[indexPath.row];
    webViewViewController *web =[webViewViewController new];
    
    web.url =model.url;
    
    
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
