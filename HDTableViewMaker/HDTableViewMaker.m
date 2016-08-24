//
//  HDTableViewMaker.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDTableViewMaker.h"
#import "HDTableData.h"
#import "HDSectionMaker.h"
#import "HDSectionData.h"

#define HDStringSelector(_SEL_) NSStringFromSelector(@selector(_SEL_))


@interface HDTableViewMaker ()

@end

@implementation HDTableViewMaker

- (instancetype)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.tableData.tableView = tableView;
    }
    return self;

}
- (instancetype)initWithTableData:(HDTableData *)tableData{
    self = [super init];
    if (self) {
        self.tableData = tableData;
    }
    return self;

}

- (HDTableViewMaker * (^)(UIView * (^)()))hd_tableViewHeaderView {
    return ^HDTableViewMaker *(UIView * (^view)()) {
        UIView * headerView =  view();
        [self.tableData.tableView.tableHeaderView layoutIfNeeded];
        self.tableData.tableView.tableHeaderView = headerView;
        return self;
    };
}

- (HDTableViewMaker * (^)(UIView * (^)()))hd_tableViewFooterView {
    return ^HDTableViewMaker *(UIView * (^view)()) {
        UIView * footerView =  view();
        [self.tableData.tableView.tableFooterView layoutIfNeeded];
        self.tableData.tableView.tableFooterView = footerView;
        return self;
    };
}

- (HDTableViewMaker * (^)(CGFloat))hd_height {
    return ^HDTableViewMaker *(CGFloat height) {
        self.tableData.rowHeight = height;
        self.tableData.tableView.rowHeight = height;
        return self;
    };
}

- (HDTableViewMaker * (^)(NSInteger))hd_sectionCount {
    return ^HDTableViewMaker *(NSInteger sectionCount) {
        self.tableData.sectionCount = sectionCount;
        return self;
    };
}

- (HDTableViewMaker * (^)(SectionCountBlock))hd_sectionCountBk{
    return ^HDTableViewMaker *(SectionCountBlock sectionCountBlock){
        self.tableData.sectionCountBlock = sectionCountBlock;
        return self;
    };
}

- (HDTableViewMaker * (^)(SectionMakeBlock))hd_sectionMaker{
    return ^HDTableViewMaker *(SectionMakeBlock sectionMakeBlock){
        self.tableData.sectionMakeBlock = sectionMakeBlock;
        return self;
    };
}

- (HDTableViewMaker * (^)(SectionMakeBlock))hd_addSectionMaker{
    return ^HDTableViewMaker *(SectionMakeBlock sectionMakeBlock){
        [self.tableData doAddSectionMaker:sectionMakeBlock];
        return self;
    };
}

- (HDTableViewMaker *) hd_sectionMaker:(SectionMakeBlock)sectionMakeBlock{
    self.tableData.sectionMakeBlock = sectionMakeBlock;
    return self;
}

- (HDTableViewMaker *) hd_addSectionMaker:(SectionMakeBlock)sectionMakeBlock{
    [self.tableData doAddSectionMaker:sectionMakeBlock];
    return self;
}


- (HDTableViewMaker * (^)(CellWillDisplayBlock))hd_cellWillDisplay{
    return ^HDTableViewMaker *(CellWillDisplayBlock cellWillDisplayBlock){
//        self.tableData.cellWillDisplayBlock = cellWillDisplayBlock;
        self.tableData.otherDelegateBlocksDic[HDStringSelector(tableView:willDisplayCell:forRowAtIndexPath:)] = cellWillDisplayBlock;
        return self;
    };
}

- (HDTableViewMaker * (^)(CommitEditingBlock))hd_commitEditing{
    return ^HDTableViewMaker *(CommitEditingBlock commitEditingBlock){
        self.tableData.otherDelegateBlocksDic[HDStringSelector(tableView:commitEditingStyle:forRowAtIndexPath:)] = commitEditingBlock;
        return self;
    };
}

- (HDTableViewMaker * (^)(ScrollViewDidScrollBlock))hd_scrollViewDidScroll{
    return ^HDTableViewMaker *(ScrollViewDidScrollBlock scrollViewDidScrollBlock){
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
