//
//  OtherPhotoViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/6.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "OtherPhotoViewController.h"
#import "OtherTableViewCell.h"
#import "OtherPhotoModel.h"


@interface OtherPhotoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tabelView;
    NSMutableArray *_dataArray;
    int _page;
    int _num;
}


@end

@implementation OtherPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"知名人士";
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];

    _tabelView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-66) style:UITableViewStylePlain];
    _tabelView.delegate =self;
    _tabelView.dataSource =self;
    _tabelView.rowHeight =330;
    [self.view addSubview:_tabelView];
    
    MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataModle:YES];
    }];
    _tabelView.header =header;
    MJRefreshAutoNormalFooter *footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadDataModle:NO];
    }];
    _tabelView.footer =footer;
    
    [self loadDataModle:YES];
    
}
-(void)loadDataModle:(BOOL)refresh{
    if (refresh) {
        _page =10;_num =0;
    }else{
        _page +=10;_num+=10;
    }
    
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.requestSerializer =[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", @"application/json", nil];
    

    NSString *url =[NSString stringWithFormat:@"http://c.m.163.com/newstopic/list/expert/%d-%d.html",_num,_page];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else{
            [_dataArray removeAllObjects];
        }
        
         NSLog(@"%@",responseObject);
        for (NSDictionary *objDic in responseObject[@"data"] [@"expertList"]) {
            Expertlists *model =[Expertlists new];
            [model yy_modelSetWithDictionary:objDic];
            [_dataArray addObject:model];
            NSLog(@"00");

        }
        
        [_tabelView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  OtherTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[OtherTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        Expertlists *model =_dataArray[indexPath.row ];
        cell.model =model;
    
    }
    return cell;
}
-(void)onClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}







@end
