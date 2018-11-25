//
//  ViewController.m
//  自定义不等高cell
//
//  Created by le tong on 2018/11/24.
//  Copyright © 2018年 limin. All rights reserved.
//

#import "ViewController.h"
#import "LMStatesCell.h"
#import "LMStatusModel.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *statusTableView;

@property (nonatomic, strong) NSArray *statusArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.statusTableView];
    NSError *error;
    
//    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Status" ofType:@"plist"]];
//    NSLog(@"%@",array);
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Status" ofType:@"plist"]];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dic in dataArray) {
        LMStatusModel *statusModel = [[LMStatusModel alloc] initWithDictionary:dic error:&error];
        [tempArray addObject:statusModel];
    }
    self.statusArray = tempArray;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ===============UITableViewDataSource==================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.statusArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LMStatesCell *cell = [tableView dequeueReusableCellWithIdentifier:kLMStatesCell];
    cell.status = self.statusArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LMStatesCell heightForCell:self.statusArray[indexPath.row]];
}


#pragma mark ===============lazy==================

- (UITableView *)statusTableView
{
    if (!_statusTableView) {
        _statusTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        [_statusTableView registerClass:[LMStatesCell class] forCellReuseIdentifier:kLMStatesCell];
        _statusTableView.delegate = self;
        _statusTableView.dataSource = self;
    }
    return _statusTableView;
}

- (NSArray *)strtusArray
{
    if (!_statusArray) {
        _statusArray = [NSArray array];
    }
    return _statusArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
