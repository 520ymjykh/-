//
//  HotsNewsViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/2/25.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "HotsNewsViewController.h"
#import "HostsModel.h"
#import "webViewViewController.h"
#import "HotsTableViewCell.h"
@interface HotsNewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,assign)int page;
@end
static const int starPage =1;
static const int rowsPage =20;
@implementation HotsNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    
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
        _tableView.header =header;
        [header setTitle:@"正在加载数据" forState:MJRefreshStateRefreshing];
         [self loadDataModel:YES];
        
    }];
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
    [paramDic setObject:@(rowsPage) forKey:@"num"];

    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    
    _urlStr = @"http://api.huceo.com/wxnew/?key=acb6b162a1639a798b3fa80f13fb073c";
    
    
    [manager GET:_urlStr parameters:paramDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else if (MJRefresh){
            [_dataArray removeAllObjects];
        }
        for (NSDictionary *objDict in responseObject[@"newslist"]) {
            News *model =[[News alloc]init];
            [model yy_modelSetWithDictionary:objDict];
           
            [_dataArray addObject:model];
            
            
            
        }
        
        dispatch_async(dispatch_get_main_queue(),
                       ^{
            [_tableView reloadData];
                       });
        
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   HotsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[HotsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    News *modle =_dataArray[indexPath.row];

    cell.model =modle;
    cell.layer.transform =CATransform3DMakeRotation(M_PI_2, 1, 0, 0);
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:10 options:UIViewAnimationOptionLayoutSubviews animations:^{
        cell.layer.transform =CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
    }];

    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        News *model =_dataArray[indexPath.row];
    webViewViewController *web =[[webViewViewController alloc]init];
    
    web.url = model.url;
    [self.navigationController pushViewController:web animated:YES];
    
}










@end
