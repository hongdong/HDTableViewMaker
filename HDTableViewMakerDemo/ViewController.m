//
//  ViewController.m
//  HDTableViewDataSourceDemo
//
//  Created by Abner on 16/7/16.
//  Copyright © 2016年 Abner. All rights reserved.
//

#import "ViewController.h"
#import "HDTableViewCell.h"
#import "HDTableViewMakerHeader.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTable;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, assign) BOOL isEmpty;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
            _dataArr = @[@"一行代码配置tableView的所有属性",@"包括创建数据源、代理",@"Cell自动高度",@"下拉刷新、上拉加载更多",@"正对tableView的覆盖层，loading覆盖层、empty覆盖层、error覆盖层",@"代码简单、逻辑紧凑",@"aaaaadfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsddfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsddaaaaadfdfsdfsdfsdfsdfsd"];
    
    [_mainTable hd_coverLoading];
    [[_mainTable hd_tableViewMaker:^(HDTableViewMaker *tableViewMaker) {
        
        [tableViewMaker.hd_sectionCount(1) hd_sectionMaker:^(HDSectionMaker *sectionMaker) {
            
            [sectionMaker.hd_dataArr(HDDataArr(self.dataArr)) hd_cellMaker:^(HDCellMaker *cellMaker) {
                cellMaker
                .hd_cellClassXib(HDCellClass(HDTableViewCell))
                .hd_adapter(HDAdapter(((HDTableViewCell *)cell).title = data;))
                .hd_event(HDEvent(NSLog(@"你好");))
                .hd_autoHeight();
            }];

        }];
        
    }] hd_addAllFresh:^(HDFreshType freshType) {
        [_mainTable hd_endFreshing:NO];
        if (freshType == HDFreshTypeFresh) {
            self.dataArr = nil;
            //        [_mainTable reloadData];   //下面一行代码会自动调用table的reload
            [_mainTable hd_coverEmpty];
        }else{
            
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
/**
 *  GET
 */


@end
