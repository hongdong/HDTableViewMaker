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

#define HDStringSelector(_SEL_) NSStringFromSelector(@selector(_SEL_))


@interface HDTableViewDataSourceMaker ()<UITableViewDataSource,UITabBarDelegate>

@end

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

- (HDTableViewDataSourceMaker * (^)(SectionMakeBlock))hd_section{
    return ^HDTableViewDataSourceMaker *(SectionMakeBlock sectionMakeBlock){
        self.tableData.sectionMakeBlock = sectionMakeBlock;
        return self;
    };
}


- (HDTableViewDataSourceMaker * (^)(CellWillDisplayBlock))hd_cellWillDisplay{
    return ^HDTableViewDataSourceMaker *(CellWillDisplayBlock cellWillDisplayBlock){
//        self.tableData.cellWillDisplayBlock = cellWillDisplayBlock;
        self.tableData.otherDelegateBlocksDic[HDStringSelector(tableView:willDisplayCell:forRowAtIndexPath:)] = cellWillDisplayBlock;
        return self;
    };
}

- (HDTableViewDataSourceMaker * (^)(CommitEditingBlock))hd_commitEditing{
    return ^HDTableViewDataSourceMaker *(CommitEditingBlock commitEditingBlock){
        self.tableData.otherDelegateBlocksDic[HDStringSelector(tableView:commitEditingStyle:forRowAtIndexPath:)] = commitEditingBlock;
        return self;
    };
}

- (HDTableViewDataSourceMaker * (^)(ScrollViewDidScrollBlock))hd_scrollViewDidScroll{
    return ^HDTableViewDataSourceMaker *(ScrollViewDidScrollBlock scrollViewDidScrollBlock){
        self.tableData.otherDelegateBlocksDic[HDStringSelector(scrollViewDidScroll:)] = scrollViewDidScrollBlock;
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
