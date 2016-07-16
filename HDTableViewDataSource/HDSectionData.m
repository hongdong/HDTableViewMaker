//
//  HDSectionData.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDSectionData.h"

@implementation HDSectionData
/**
 *  GET
 */
-(NSInteger)rowCount{
    if (_rowCount==0) {
        _rowCount = _modelDatas.count;
    }
    return _rowCount;
}

-(NSMutableArray<HDCellData *> *)cellDatas{
    if (!_cellDatas) {
        _cellDatas = [NSMutableArray array];
    }
    return _cellDatas;
}
@end
