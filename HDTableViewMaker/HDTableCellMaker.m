//
//  HDTableCellMaker.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDTableCellMaker.h"
#import "HDCellData.h"

@implementation HDTableCellMaker

- (instancetype)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.cellData.tableView = tableView;
    }
    return self;
    
}

- (HDTableCellMaker * (^)())autoHeight {
    return ^HDTableCellMaker * {
        self.cellData.isAutoHeight = YES;
        return self;
    };
}

- (HDTableCellMaker * (^)(CGFloat))rowHeight{
    return ^HDTableCellMaker *(CGFloat height){
        self.cellData.rowHeight = height;
        return self;
    };
}

- (HDTableCellMaker * (^)(Class))cell {
    return ^HDTableCellMaker *(Class cell) {
        self.cellData.cell = cell;
        return self;
    };
}

- (HDTableCellMaker * (^)(id))data {
    return ^HDTableCellMaker *(id data) {
        self.cellData.data = data;
        return self;
    };
}

- (HDTableCellMaker * (^)(CellAdapterBlock))adapter {
    return ^HDTableCellMaker *(CellAdapterBlock adapterBlock) {
        self.cellData.adapter = adapterBlock;
        return self;
    };
}

- (HDTableCellMaker * (^)(CellEventBlock))event {
    return ^HDTableCellMaker *(CellEventBlock event) {
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
