//
//  HDCellMaker.m
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDCellMaker.h"
#import "HDCellData.h"

@implementation HDCellMaker

- (instancetype)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.cellData.tableView = tableView;
    }
    return self;
    
}

- (HDCellMaker * (^)())hd_autoHeight {
    return ^HDCellMaker * {
        self.cellData.isAutoHeight = YES;
        return self;
    };
}

- (HDCellMaker * (^)(CGFloat))hd_rowHeight{
    return ^HDCellMaker *(CGFloat height){
        self.cellData.rowHeight = height;
        return self;
    };
}

- (HDCellMaker * (^)(Class))hd_cellClass {
    return ^HDCellMaker *(Class cell) {
        self.cellData.cell = cell;
        return self;
    };
}

- (HDCellMaker * (^)(id))hd_data {
    return ^HDCellMaker *(id data) {
        self.cellData.data = data;
        return self;
    };
}

- (HDCellMaker * (^)(CellAdapterBlock))hd_adapter {
    return ^HDCellMaker *(CellAdapterBlock adapterBlock) {
        self.cellData.adapter = adapterBlock;
        return self;
    };
}

- (HDCellMaker * (^)(CellEventBlock))hd_event {
    return ^HDCellMaker *(CellEventBlock event) {
        self.cellData.event = event;
        return self;
    };
}




/**
 *  GET
 */
- (HDCellData *)cellData
{
    if (!_cellData) {
        _cellData = [HDCellData new];
    }
    return _cellData;
}


@end
