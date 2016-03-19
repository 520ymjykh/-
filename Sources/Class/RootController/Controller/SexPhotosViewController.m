//
//  SexPhotosViewController.m
//  NewsReading
//
//  Created by 千锋 on 16/3/5.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SexPhotosViewController.h"
#import "SexPhotoModel.h"
#import "CollectionViewCell.h"
#import "PhotoScrollViewController.h"
@interface SexPhotosViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collection;
    NSMutableArray *_dataArray;
    int _page;
}
@end

@implementation SexPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UICollectionViewFlowLayout *fLayout =[[UICollectionViewFlowLayout alloc]init];
    fLayout.scrollDirection =UICollectionViewScrollDirectionVertical;
    fLayout.itemSize =CGSizeMake(self.view.frame.size.width/3, self.view.frame.size.width/5+30);
    fLayout.minimumInteritemSpacing =20;
    fLayout.minimumLineSpacing =20;
    fLayout.sectionInset =UIEdgeInsetsMake(20, 20, 20, 20);
    _collection =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height) collectionViewLayout:fLayout];
    _collection.dataSource =self;
    _collection.delegate =self;
    
    _collection.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    [_collection registerNib:[UINib nibWithNibName:@"CollectionViewCell"  bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collection];
    MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataModle:YES];
    }];
    _collection.header =header;
    MJRefreshAutoNormalFooter *footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadDataModle:NO];
    }];
    _collection.footer =footer;
    
    [self loadDataModle:YES];
    
}

-(void)loadDataModle:(BOOL)refresh{
    if (refresh) {
        _page =50;
    }else{
        _page+=20;
    }
    
    
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.requestSerializer =[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", @"application/json", nil];
    
    NSString *url =[NSString stringWithFormat:@"http://api.huceo.com/meinv/?key=acb6b162a1639a798b3fa80f13fb073c&num=%d",_page];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!_dataArray) {
            _dataArray =[NSMutableArray array];
        }else{
            [_dataArray removeAllObjects];
        }
        for (NSDictionary *dict in responseObject[@"newslist"]) {
            Newslist *model =[[Newslist alloc]init];
            [model yy_modelSetWithDictionary:dict];
            [_dataArray addObject:model];
            
            
        }
        
        dispatch_async(dispatch_get_main_queue(),
                       ^{
            [_collection reloadData];
                           
                       });
        [_collection.header endRefreshing];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        
    }];
  }

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    Newslist *modle =_dataArray[indexPath.row];
    [cell.photoView sd_setImageWithURL:[NSURL URLWithString:modle.picUrl]placeholderImage:[UIImage imageNamed:@"image010.jpg"]];
    cell.deseLabel.text =modle.title;
     return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Newslist *model =_dataArray[indexPath.row];
    PhotoScrollViewController *photo =[[PhotoScrollViewController alloc]init];
    photo.picUrl =model.picUrl;
    
    [self presentViewController:photo animated:YES completion:nil];
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
