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
#import <UIKit/UIKit.h>
#import "UITableView+HDCover.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTable;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, assign) BOOL isEmpty;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
            _dataArr = @[@"一行代码配置tableView的所有属性",@"包括创建数据源、代理",@"Cell自动高度",@"下拉刷新、上拉加载更多",@"正对tableView的覆盖层，loading覆盖层、empty覆盖层、error覆盖层",@"代码简单、逻辑紧凑",@"aaaaadfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsddfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsdsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsd",@"aaaaadfdfsdfsdfsdfsdfsaaaaadfdfsdfsdfsdfsdfsdaaaaadfdfsdfsdfsdfsdfsddaaaaadfdfsdfsdfsdfsdfsd"];
// 动态方式的应用
//    [[_mainTable hd_tableViewMaker:^(HDTableViewMaker *tableViewMaker) {
//        
//        [tableViewMaker.hd_scrollViewDidScroll(^(UIScrollView *scrollView){
//            NSLog(@"nihao");
//        }).hd_sectionCountBk(HDSectionCount(return 1;)) hd_sectionMaker:^(HDSectionMaker *sectionMaker) {
//            
//            [sectionMaker.hd_dataArr(HDDataArr(self.dataArr)) hd_cellMaker:^(HDCellMaker *cellMaker) {
//                cellMaker
//                .hd_cellClassXib(HDCellClass(HDTableViewCell))
//                .hd_adapter(HDAdapter(((HDTableViewCell *)cell).title = data;))
//                .hd_event(HDEvent(NSLog(@"你好");))
//                .hd_autoHeight();
//            }];
//
//        }];
//                
//    }] hd_addAllFresh:^(HDFreshType freshType) {
//        [_mainTable hd_endFreshing:YES];
//        if (freshType == HDFreshTypeFresh) {
//            [_mainTable hd_coverEmpty:^{
//                 [_mainTable hd_coverDismiss];
//            }];
//        }else{
//            _dataArr = nil;
//            [_mainTable reloadData];
//            [_mainTable hd_coverError:^{
//            }];
//        }
//    }];
    
//静态方式的应用
//    [_mainTable hd_tableViewMaker:^(HDTableViewMaker *tableMaker) {
//        
//        HDAddSectionMaker(
//                          
//            
//                          HDAddCellMaker(
//                               cellMaker
//                               .hd_cellClassXib(HDCellClass(HDTableViewCell))
//                               .hd_adapter(HDAdapter(((HDTableViewCell *)cell).title = @"静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试第一组第一个";))
//                               .hd_event(HDEvent(NSLog(@"你好");))
//                               .hd_autoHeight();
//                               );
//                          
//                          HDAddCellMaker(
//                                 cellMaker
//                                 .hd_cellClassXib(HDCellClass(HDTableViewCell))
//                                 .hd_adapter(HDAdapter(((HDTableViewCell *)cell).title = @"静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试第一组第二个";))
//                                 .hd_event(HDEvent(NSLog(@"你好");))
//                                 .hd_autoHeight();
//                                 );
//                          
//        );
//        
//        HDAddSectionMaker(
//                          
//                          sectionMaker.hd_headerView(^(){
//                                                        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//                                                        return view;
//                                                    });
//                          
//                          HDAddCellMaker(
//                                         cellMaker
//                                         .hd_cellClassXib(HDCellClass(HDTableViewCell))
//                                         .hd_adapter(HDAdapter(((HDTableViewCell *)cell).title = @"静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试第二组第一个";))
//                                         .hd_event(HDEvent(NSLog(@"你好");))
//                                         .hd_autoHeight();
//                                         );
//                          
//                          HDAddCellMaker(
//                                         cellMaker
//                                         .hd_cellClassXib(HDCellClass(HDTableViewCell))
//                                         .hd_adapter(HDAdapter(((HDTableViewCell *)cell).title = @"静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试静态表格测试第二组第二个";))
//                                         .hd_event(HDEvent(NSLog(@"你好");))
//                                         .hd_autoHeight();
//                                         );
//                          
//                          );
//    }];
    
//动静结合-1
    [_mainTable hd_tableViewMaker:^(HDTableViewMaker *tableMaker) {
        [[tableMaker hd_addSectionMaker:^(HDSectionMaker *sectionMaker) {
            [sectionMaker
            .hd_headerTitle(@"1")
            .hd_rowHeight(44)
            .hd_dataArr(HDDataArr(self.dataArr)) hd_cellMaker:^(HDCellMaker *cellMaker) {
                cellMaker
                .hd_cellClass(HDCellClass(UITableViewCell))
                .hd_adapter
                (HDAdapter(
                           cell.textLabel.text = data;
                 ));
            }];
        }] hd_addSectionMaker:^(HDSectionMaker *sectionMaker) {
            [sectionMaker
             .hd_headerTitle(@"2")
             .hd_rowHeight(44)
             .hd_dataArr(HDDataArr(self.dataArr)) hd_cellMaker:^(HDCellMaker *cellMaker) {
                 cellMaker
                 .hd_cellClass(HDCellClass(UITableViewCell))
                 .hd_adapter
                 (HDAdapter(
                            cell.textLabel.text = data;
                            ));
             }];
        }];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
/**
 *  GET
 */


@end
