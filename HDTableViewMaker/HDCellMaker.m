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

- (HDCellMaker * (^)())autoHeight {
    return ^HDCellMaker * {
        self.cellData.isAutoHeight = YES;
        return self;
    };
}

- (HDCellMaker * (^)(CGFloat))rowHeight{
    return ^HDCellMaker *(CGFloat height){
        self.cellData.rowHeight = height;
        return self;
    };
}

- (HDCellMaker * (^)(Class))cell {
    return ^HDCellMaker *(Class cell) {
        self.cellData.cell = cell;
        return self;
    };
}

- (HDCellMaker * (^)(id))data {
    return ^HDCellMaker *(id data) {
        self.cellData.data = data;
        return self;
    };
}

- (HDCellMaker * (^)(CellAdapterBlock))adapter {
    return ^HDCellMaker *(CellAdapterBlock adapterBlock) {
        self.cellData.adapter = adapterBlock;
        return self;
    };
}

- (HDCellMaker * (^)(CellEventBlock))event {
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
