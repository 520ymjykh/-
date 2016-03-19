//
//  SearchView.m
//  NewsReading
//
//  Created by 千锋 on 16/3/15.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "SearchView.h"
#import "SearchModel.h"
@interface SearchView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SearchView
{
    UILabel *_titleLable;
    UIImageView *_iamgeView;
    UILabel *_desc;
    UILabel *_message;
    UITableView *_tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];

    
    
    _titleLable =[[UILabel alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 80)];
    _titleLable.text =_model.title;
    _titleLable.numberOfLines =0;
    [self.view addSubview:_titleLable];
    _iamgeView =[[UIImageView alloc]initWithFrame:CGRectMake(6, 160, self.view.frame.size.width-12, 200)];
    [_iamgeView sd_setImageWithURL:[NSURL URLWithString:_model.img]];
     [self.view addSubview:_iamgeView];
    
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(6, 380, self.view.frame.size.width-12, self.view.frame.size.height) style:UITableViewStylePlain];
//    _tableView.rowHeight =420;
    _tableView.dataSource =self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 160;
    }else{
        return 500;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
    }
    
    if (indexPath.row ==0) {
        cell.textLabel.text =_model.desc;
        cell.textLabel.numberOfLines =0;
        
    }else if (indexPath.row ==1){
        cell.textLabel.text =_model.message;
        cell.textLabel.numberOfLines =0;
        cell.textLabel.font =[UIFont systemFontOfSize:13];

    }
    
    
    return cell;
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
