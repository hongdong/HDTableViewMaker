//
//  HDTableViewDataSourceMaker.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDTableViewDataSourceMaker.h"
#import "HDTableData.h"
#import "HDTableSectionMaker.h"
#import "HDSectionData.h"

@implementation HDTableViewDataSourceMaker

- (instancetype)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.tableData.tableView = tableView;
    }
    return self;

}

- (HDTableViewDataSourceMaker * (^)(UIView * (^)()))hd_tableViewHeaderView {
    return ^HDTableViewDataSourceMaker *(UIView * (^view)()) {
        UIView * headerView =  view();
        [self.tableData.tableView.tableHeaderView layoutIfNeeded];
        self.tableData.tableView.tableHeaderView = headerView;
        return self;
    };
}

- (HDTableViewDataSourceMaker * (^)(UIView * (^)()))hd_tableViewFooterView {
    return ^HDTableViewDataSourceMaker *(UIView * (^view)()) {
        UIView * footerView =  view();
        [self.tableData.tableView.tableFooterView layoutIfNeeded];
        self.tableData.tableView.tableFooterView = footerView;
        return self;
    };
}

- (HDTableViewDataSourceMaker * (^)(CGFloat))hd_height {
    return ^HDTableViewDataSourceMaker *(CGFloat height) {
        self.tableData.rowHeight = height;
        self.tableData.tableView.rowHeight = height;
        return self;
    };
}

- (HDTableViewDataSourceMaker * (^)(NSInteger))hd_sectionCount {
    return ^HDTableViewDataSourceMaker *(NSInteger sectionCount) {
        self.tableData.sectionCount = sectionCount;
        return self;
    };
}

- (HDTableViewDataSourceMaker * (^)(void (^)(HDTableSectionMaker * section)))hd_section{
    return ^HDTableViewDataSourceMaker *(void (^sectionMakeBlock)(HDTableSectionMaker * sectionMaker)){
        for (int i = 0; i<self.tableData.sectionCount; i++) {
            HDTableSectionMaker * sectionMaker = [[HDTableSectionMaker alloc] initWithTableView:self.tableData.tableView];
            if (self.tableData.rowHeight!=0) {
                sectionMaker.sectionData.rowHeight = self.tableData.rowHeight;
            }
            sectionMaker.sectionData.section = i;
            sectionMakeBlock(sectionMaker);
            [self.tableData.sectionDatas addObject:sectionMaker.sectionData];
        }
        return self;
    };
}


/**
 *  GET
 */
- (HDTableData *)tableData
{
    if (!_tableData) {
        _tableData = [HDTableData new];
    }
    return _tableData;
}

@end
