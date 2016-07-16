//
//  HDTableData.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDTableData.h"

@implementation HDTableData
/**
 *  GET
 */

-(NSInteger)sectionCount{
    if (0==_sectionCount) {
        _sectionCount = 1;
    }
    return _sectionCount;
}

-(NSMutableArray<HDSectionData *> *)sectionDatas{
    if (!_sectionDatas) {
        _sectionDatas = [NSMutableArray array];
    }
    return _sectionDatas;
}
@end
