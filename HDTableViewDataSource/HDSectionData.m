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

-(CGFloat)headerHeight{
    if (_headerHeight==0) {
        if (self.headerView) {
            _headerHeight = _headerView.frame.size.height;
        }
        if (self.headerTitle) {
            _headerHeight = 40;
        }
    }
    return _headerHeight;
}

-(CGFloat)footerHeight{
    if (_footerHeight==0) {
        if (self.footerView) {
            _headerHeight = _footerView.frame.size.height;
        }
        if (self.footerTitle) {
            _headerHeight = 40;
        }
    }

    return _footerHeight;
}

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
