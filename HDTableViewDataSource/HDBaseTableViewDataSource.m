//
//  HDBaseTableViewDataSource.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDBaseTableViewDataSource.h"
#import <objc/runtime.h>
#import "HDSectionData.h"
#import "HDTableData.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "HDCellData.h"

@implementation HDBaseTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableData.sectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.sectionDatas[(NSUInteger) section].rowCount;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.tableData.sectionDatas[(NSUInteger) section].headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.tableData.sectionDatas[(NSUInteger) section].footerTitle;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.tableData.sectionDatas[(NSUInteger) section].headerView;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.tableData.sectionDatas[(NSUInteger) section].footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(self.tableData.sectionDatas[(NSUInteger) section].headerView) {
        return self.tableData.sectionDatas[(NSUInteger) section].headerView.frame.size.height;
    } else if(self.tableData.sectionDatas[(NSUInteger) section].headerTitle) {
        return 40;
    } else {
        return 0;
    };
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if(self.tableData.sectionDatas[(NSUInteger) section].footerView) {
        return self.tableData.sectionDatas[(NSUInteger) section].footerView.frame.size.height;
    } else if(self.tableData.sectionDatas[(NSUInteger) section].footerTitle) {
        return 40;
    } else {
        return 0;
    };
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    
    HDCellData *cellData = self.tableData.sectionDatas[section].cellDatas[index];

    return cellData.rowHeight;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    
    HDCellData *cellData = self.tableData.sectionDatas[section].cellDatas[index];

    return [cellData getReturnCell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HDCellData *cellData = self.tableData.sectionDatas[section].cellDatas[index];
    
    if (cellData.event) {
        cellData.event(indexPath,cellData.data);
    }
    
}


@end
