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
    
            _dataArr = @[@"自动高度aaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdaaaaadfdfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsddfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsddaaaaadfdfsdfsdfsdfsdfsd"];
    
//    [_mainTable hd_coverLoading];
    
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
        self.dataArr = nil;
//        [_mainTable reloadData];
        [_mainTable hd_coverEmpty];
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
