//
//  HeardsNewsViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "HeardsNewsViewController.h"
#import "HeaderModel.h"
#import "webViewViewController.h"
#import "ScrollViewModle.h"
#import "TableViewCell.h"
static const int starPage =1;
static const int rowsPage =20;
@interface HeardsNewsViewController ()<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate,UIScrollViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    AFHTTPSessionManager *_manager;
    NSUInteger _currentPage;
    UIScrollView *_scrollView;
    NSMutableArray *_scDataArray;
    NSTimer *_timer;
    int _page;
}

@end

@implementation HeardsNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createScrollView];

    [self createTableView];
   }

-(void)createScrollView{
    _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 190)];
    
    _scrollView.showsHorizontalScrollIndicator =NO;
    _scrollView.showsVerticalScrollIndicator =NO;
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    [manager GET:@"http://c.3g.163.com/photo/api/set/0001/112579.json" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_scDataArray) {
            _scDataArray =[NSMutableArray array];
        }else{
            [_scDataArray removeAllObjects];
        }
        
        for (NSDictionary *objDic in responseObject[@"photos"]) {
            ScrollViewPhotos *model =[[ScrollViewPhotos alloc]init];
            [model yy_modelSetWithDictionary:objDic];
            [_scDataArray addObject:model];
            UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(_scDataArray.count*self.view.frame.size.width, 64, self.view.frame.size.width, 190)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl]];
    
            _scrollView.pagingEnabled = YES;
            _scrollView.delegate =self;
            _scrollView.contentSize =CGSizeMake(CGRectGetWidth(_scrollView.frame)*_scDataArray.count, CGRectGetHeight(_scrollView.frame));
            _scrollView.contentOffset =CGPointMake(_scDataArray.count*CGRectGetWidth(_scrollView.frame), 0);
          
            [_scrollView addSubview:imageView];

            
            
        }
    [self.view addSubview:_scrollView];
        _timer =[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollViewFrame:) userInfo:_scDataArray repeats:YES];
       
        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
   }
-(void)scrollViewFrame:(NSTimer *)timer{
    NSArray *array =timer.userInfo;
    static int _cont;
    if (_scrollView.contentOffset.x >= (array.count - 1) * self.view.frame.size.width) {
        _scrollView.contentOffset =CGPointMake(self.view.frame.size.width, 0);
        _cont =0;
    }else{
        [_scrollView setContentOffset:CGPointMake(++_cont * self.view.frame.size.width, 0) animated:YES];
    }
    
}
-(void)createTableView{
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 134, self.view.frame.size.width, self.view.frame.size.height-130) style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    _tableView.rowHeight =66;
    [self.view addSubview:_tableView];
    
    MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataModel:YES];
        _tableView.header =header;
        [header setTitle:@"正在加载数据" forState:MJRefreshStateRefreshing];
        
    }];
    
     [_tableView.header beginRefreshing];
    
    MJRefreshAutoNormalFooter  *footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadDataModel:NO];
    }];
    footer.stateLabel.text = @"上拉或点击加载更多数据";
    footer.automaticallyRefresh =NO;
    _tableView.footer =footer;
    
    
    [self loadDataModel:YES];
    
}
-(void)loadDataModel:(BOOL)MJRefresh{
    if (MJRefresh) {
        _page =starPage;
    }else{
        _page +=1;
    }
    NSMutableDictionary *paramDic =[NSMutableDictionary dictionary];
    [paramDic setObject:@(_page) forKey:@"page"];
    [paramDic setObject:@(rowsPage) forKey:@"rows"];

    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    
      _urlStr =@"http://api.avatardata.cn/WorldNews/Query?key=1bea832754614d48ab5ad7035e714c11";
    [manager GET:_urlStr parameters:paramDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else if (MJRefresh){
            [_dataArray removeAllObjects];
        }
        for (NSDictionary *objDict in responseObject[@"result"]) {
            
            HeadApp *model =[[HeadApp alloc]init];
            [model yy_modelSetWithDictionary:objDict];
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
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
        HeadApp *model =_dataArray[indexPath.row];
     
        
        cell.model =model;
        cell.layer.transform =CATransform3DMakeRotation(M_PI_2, 1, 0, 0);
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:10 options:UIViewAnimationOptionLayoutSubviews animations:^{
            cell.layer.transform =CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    HeadApp *model =_dataArray[indexPath.row];
    webViewViewController *web =[[webViewViewController alloc]init];
    
    web.url = model.url;
    [self.navigationController pushViewController:web animated:YES];
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [_timer invalidate];
    _timer =nil;
 
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
