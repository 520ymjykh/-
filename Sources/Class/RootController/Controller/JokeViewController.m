//
//  JokeViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/7.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "JokeViewController.h"
#import "JokeModel.h"
#import "JokeTableViewCell.h"
#import "webViewViewController.h"
#import "jokeOtherModel.h"
#import "JokeView.h"
#import "YLGIFImage.h"
#import "YLImageView.h"
@interface JokeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
  int _page;
   int _num;
    YLImageView *_imageView;
}

@end

@implementation JokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    self.title =@"特别推荐";
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];

}

-(void)createTableView{
    _imageView =[[YLImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 160)];
    

    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:@"http://dingyue.nosdn.127.net/ZPDMlPc4McxhvQGfxctEIIV7Uv5P7kslZwqF4GVfPmvCm1457445348291.gif"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        _imageView.image = [YLGIFImage imageWithData:data];
    }];
    
    
    [self.view addSubview:_imageView];
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height-200) style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    _tableView.rowHeight =66;

    [self.view addSubview:_tableView];
    
    MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataModle:YES];
        
    }];
    _tableView.header =header;
    [header setTitle:@"下拉刷新更多数据" forState: MJRefreshStatePulling];
    MJRefreshAutoNormalFooter *footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadDataModle:NO];
    }];
    _tableView.footer =footer;
    [footer setTitle:@"点击或上拉加载更多" forState:MJRefreshStatePulling];
    [self loadDataModle:YES];
}
-(void)loadDataModle:(BOOL)refresh{
    if (refresh) {
        _page =10;
    }else {
        _page +=10;
    }
    
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.requestSerializer =[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json", nil];
    
    
    NSString *url =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1395298452550/%d-10.html",_page];
//    http://c.3g.163.com/nc/article/list/T1395298452550/20-20.html
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else{
            [_dataArray removeAllObjects];
        }

        for (NSDictionary *objDic in responseObject[@"T1395298452550"]) {
            
            
            jokeModels *model =[[jokeModels alloc]init];
            [model yy_modelSetWithDictionary:objDic];
            [_dataArray addObject:model];
                   }
        [_tableView reloadData];
               
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JokeTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[JokeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
    }
    jokeModels *model =_dataArray[indexPath.row];
    cell.model =model;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    jokeModels *model =_dataArray[indexPath.row];
    JokeView *joke =[JokeView new];
    joke.model =model;
    
    [self presentViewController:joke animated:YES completion:nil];
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
