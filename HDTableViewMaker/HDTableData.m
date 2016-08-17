//
//  HDTableData.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDTableData.h"
#import "HDSectionMaker.h"

@implementation HDTableData

-(instancetype)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.tableView = tableView;
    }
    return self;
}

/**
 *  GET
 */

-(NSUInteger)sectionCount{
    
    if (self.sectionCountBlock) {
        _sectionCount = self.sectionCountBlock();
    }
    
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
    if (_sectionCount>0&&self.sectionMakeBlock) {
        [_sectionDatas removeAllObjects];
        for (NSUInteger i = 0; i<_sectionCount; i++) {
            HDSectionMaker * sectionMaker = [[HDSectionMaker alloc] initWithTableView:self.tableView];
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
