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

#define HDDataArr(__dataArr__) ^(){return __dataArr__;}
#define HDCellClass(_cellClass_) [_cellClass_ class]
#define HDAdapter(_adapter_) \
^(UITableViewCell *cell,id data,NSIndexPath *indexPath){ \
_adapter_ \
}


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTable;

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[_mainTable hd_tableViewMaker:^(HDTableViewMaker *tableViewMaker) {
        
        [tableViewMaker.hd_sectionCount(1) hd_sectionMaker:^(HDSectionMaker *sectionMaker) {
            
            [sectionMaker.hd_dataArr(HDDataArr(self.dataArr)) hd_cellMaker:^(HDCellMaker *cellMaker) {
                cellMaker.hd_cellClass(HDCellClass(HDTableViewCell)).hd_adapter(HDAdapter(
                                    HDTableViewCell *myCell = (HDTableViewCell *)cell;
                                                    myCell.title = data;
                                      )).hd_autoHeight();
            }];

        }];
        
    }] hd_addAllFresh:^(HDFreshType freshType) {
        [_mainTable hd_endFreshing:NO];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
/**
 *  GET
 */

-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"自动高度aaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdaaaaadfdfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsddfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsddaaaaadfdfsdfsdfsdfsdfsd"];
    }
    return _dataArr;
}

@end
