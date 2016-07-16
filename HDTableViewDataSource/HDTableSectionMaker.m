//
//  HDTableSectionMaker.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDTableSectionMaker.h"
#import "HDSectionData.h"
#import "HDTableCellMaker.h"

@implementation HDTableSectionMaker

- (instancetype)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.sectionData.tableView = tableView;
    }
    return self;
    
}

- (HDTableSectionMaker * (^)(NSArray *))data {
    return ^HDTableSectionMaker *(NSArray * datas) {
        self.sectionData.modelDatas = datas;
        return self;
    };
}

- (HDTableSectionMaker * (^)(NSString *))headerTitle {
    return ^HDTableSectionMaker *(NSString * title) {
        self.sectionData.headerTitle = title;
        return self;
    };
}

- (HDTableSectionMaker * (^)(NSString *))footerTitle {
    return ^HDTableSectionMaker *(NSString * title) {
        self.sectionData.footerTitle = title;
        return self;
    };
}

- (HDTableSectionMaker * (^)(CGFloat))rowHeight{
    return ^HDTableSectionMaker *(CGFloat height){
        self.sectionData.rowHeight = height;
        return self;
    };
}

- (HDTableSectionMaker * (^)(UIView * (^)()))headerView {
    return ^HDTableSectionMaker *(UIView * (^view)()) {
        self.sectionData.headerView = view();
        return self;
    };
}

- (HDTableSectionMaker * (^)(UIView * (^)()))footerView {
    return ^HDTableSectionMaker *(UIView * (^view)()) {
        self.sectionData.footerView = view();
        return self;
    };
}

- (HDTableSectionMaker * (^)(NSInteger))hd_rowCount{
    return ^HDTableSectionMaker *(NSInteger rowCount){
        self.sectionData.rowCount = rowCount;
        return self;
    };
}

- (HDTableSectionMaker * (^)(void (^)(HDTableCellMaker * cellMaker)))hd_cell{
    return ^HDTableSectionMaker *(void (^cellMakerBlock)(HDTableCellMaker * cellMaker)){
        for (int i = 0; i<self.sectionData.rowCount; i++) {
            HDTableCellMaker * cellMaker = [[HDTableCellMaker alloc] initWithTableView:self.sectionData.tableView];
            cellMaker.cellData.indexPath = [NSIndexPath indexPathForRow:i inSection:self.sectionData.section];
            cellMaker.cellData.data = self.sectionData.modelDatas[i];
            cellMakerBlock(cellMaker);
            [self.sectionData.cellDatas addObject:cellMaker.cellData];
        }
        return self;
    };
}


/**
 *  GET
 */
- (HDSectionData *)sectionData {
    if (! _sectionData) {
        _sectionData = [HDSectionData new];
    }
    return _sectionData;
}

@end
