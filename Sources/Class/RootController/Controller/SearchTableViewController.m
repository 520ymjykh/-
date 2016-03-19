//
//  SearchTableViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/14.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SearchTableViewController.h"
#import "SearchModel.h"
#import "SearchTableViewCell.h"
#import "SearchView.h"
#import "KVNProgress.h"
@interface SearchTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [self createTableView];

}
-(void)createTableView{
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 156)];
    UIImage *image =[UIImage imageNamed:@"search.jpg"];
    imageView.image =image;
    [self.view addSubview:imageView];
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, self.view.frame.size.height-220) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.rowHeight =68;
    [self.view addSubview:_tableView];
    
    [self loadDataModel];
}
-(void)loadDataModel{
    [KVNProgress showWithStatus:@"正在努力加载。。。"];
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.requestSerializer =[AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval =10;
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json", nil];
    
    NSMutableDictionary *paramDic =[NSMutableDictionary dictionary];
    [paramDic setObject:_searchText forKey:@"keyword"];
    [paramDic setObject:@"topword" forKey:@"name"];
    
    [manager GET:@"http://www.tngou.net/api/search" parameters:paramDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else{
            [_dataArray removeAllObjects];
        }
        for (NSDictionary *dict in responseObject[@"tngou"]) {
            searchModel *modle =[searchModel new];
            [modle yy_modelSetWithDictionary:dict];
            [KVNProgress showSuccessWithStatus:@"加载完成"];
            [_dataArray addObject:modle];
        }
        [_tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        [KVNProgress showErrorWithStatus:@"加载失败"];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[SearchTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
        
    }
        searchModel *modle =_dataArray[indexPath.row];
   
    cell.model =modle;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    searchModel *modle =_dataArray[indexPath.row];
    SearchView *search =[SearchView new];
    search.model =modle;
    
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
