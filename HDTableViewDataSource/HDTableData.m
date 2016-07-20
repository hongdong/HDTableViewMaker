//
//  HDTableData.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDTableData.h"
#import "HDTableSectionMaker.h"

@implementation HDTableData
/**
 *  GET
 */

-(NSInteger)sectionCount{
//    if (0==_sectionCount) {
//        _sectionCount = 1;
//    }
    if (0==_sectionCount&&self.sectionDatas.count>0) {
        _sectionCount = self.sectionDatas.count;
    }
    return _sectionCount;
}

-(NSMutableArray<HDSectionData *> *)sectionDatas{
    if (!_sectionDatas) {
        _sectionDatas = [NSMutableArray array];
    }
    [self doSectionMakeBlock];
    return _sectionDatas;
}

-(void)doSectionMakeBlock{
    if (self.sectionCount>0&&self.sectionMakeBlock) {
        [_sectionDatas removeAllObjects];
        for (int i = 0; i<self.sectionCount; i++) {
            HDTableSectionMaker * sectionMaker = [[HDTableSectionMaker alloc] initWithTableView:self.tableView];
            if (self.rowHeight!=0) {
                sectionMaker.sectionData.rowHeight = self.rowHeight;
            }
            sectionMaker.sectionData.section = i;
            self.sectionMakeBlock(sectionMaker);
            [_sectionDatas addObject:sectionMaker.sectionData];
        }
    }
}

-(NSMutableDictionary *)otherDelegateBlocksDic{
    if (!_otherDelegateBlocksDic) {
        _otherDelegateBlocksDic = [NSMutableDictionary dictionary];
    }
    return _otherDelegateBlocksDic;
}

@end
