//
//  CartoonViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/13.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "CartoonViewController.h"
#import "CartoonModel.h"
#import "CartoonTableViewCell.h"
#import "CartoonWebViewController.h"
@interface CartoonViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CartoonViewController
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    int _page;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.title =@"精选动漫";
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [self createTableView];

}

-(void)createTableView{
    UIImage *image =[UIImage imageNamed:@"image010.jpg"];
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 160)];
    imageView.image =image;
    [self.view addSubview:imageView];
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height-200) style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    _tableView.rowHeight =300;
     _tableView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_tableView];
    
    
    MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataTableView:YES];
    }];
    _tableView.header =header;
    MJRefreshAutoNormalFooter *footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadDataTableView:NO];
    }];
    _tableView.footer =footer;
    [self loadDataTableView:YES];
}

-(void)loadDataTableView:(BOOL)refresh{
    if (refresh) {
        _page =20;
    }else{
        _page +=20;
    }
    NSString *url =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1451370429008/0-%d.html",_page];
    AFHTTPSessionManager *manger =[AFHTTPSessionManager manager];
    manger.responseSerializer =[AFJSONResponseSerializer serializer];
    manger.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json", nil];
    manger.requestSerializer.timeoutInterval =10;
    
    [manger GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_dataArray) {
            _dataArray=[NSMutableArray array];
        }else{
            [_dataArray removeAllObjects];
        }
        for (NSDictionary *dict in responseObject[@"T1451370429008"]) {
            Cartoon*model =[Cartoon new];
            [model yy_modelSetWithDictionary:dict];
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
    CartoonTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[CartoonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    Cartoon *model =_dataArray[indexPath.row];
    cell.model =model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Cartoon *model =_dataArray[indexPath.row];
   CartoonWebViewController *web =[CartoonWebViewController new];
    web.url =model.url;
    [self presentViewController:web animated:YES completion:nil];
    
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
