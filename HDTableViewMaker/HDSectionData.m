//
//  HDSectionData.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDSectionData.h"

@implementation HDSectionData

@synthesize rowCount = _rowCount;

/**
 *  GET
 */

-(CGFloat)headerHeight{
    if (_headerHeight==0) {
        _headerHeight = 0.0001;
        if (self.headerView) {
            _headerHeight = _headerView.frame.size.height;
        }
        if (self.headerTitle) {
            _headerHeight = 30;
        }
    }
    return _headerHeight;
}

-(CGFloat)footerHeight{
    if (_footerHeight==0) {
        _footerHeight = 0.0001;
        if (self.footerView) {
            _headerHeight = _footerView.frame.size.height;
        }
        if (self.footerTitle) {
            _headerHeight = 30;
        }
    }

    return _footerHeight;
}

-(NSUInteger)rowCount{
    if (_rowCount==0) {
        _rowCount = self.modelDatas.count;
    }
    return _rowCount;
}

-(void)setRowCount:(NSUInteger)rowCount{
    _rowCount = rowCount;
    [self doCellMakerBlock];
}

-(void)setCellMakeBlock:(CellMakeBlock)cellMakeBlock{
    _cellMakeBlock = cellMakeBlock;
    [self doCellMakerBlock];
}

-(void)doCellMakerBlock{
    if (self.rowCount>0&&self.cellMakeBlock) {
        [_cellDatas removeAllObjects];
        for (NSUInteger i = 0; i<self.rowCount; i++) {
            HDCellMaker * cellMaker = [[HDCellMaker alloc] initWithTableView:self.tableView];
            cellMaker.cellData.indexPath = [NSIndexPath indexPathForRow:i inSection:self.section];
            cellMaker.cellData.data = self.modelDatas[i];
            cellMaker.cellData.rowHeight = self.rowHeight;
            self.cellMakeBlock(cellMaker);
            [_cellDatas addObject:cellMaker.cellData];
        }
    }
    
}

-(NSArray *)modelDatas{
    if (self.getDataBlock) {
        _modelDatas = self.getDataBlock();
    }
    return _modelDatas;
}

-(NSMutableArray<HDCellData *> *)cellDatas{
    if (!_cellDatas) {
        _cellDatas = [NSMutableArray array];
    }
    [self doCellMakerBlock];
    return _cellDatas;
}
@end
