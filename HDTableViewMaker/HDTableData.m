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
@synthesize sectionCount = _sectionCount;
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
        [self setSectionCount:self.sectionCountBlock(self.tableView)];
    }
    
    if (0==_sectionCount&&self.sectionDatas.count>0) {
        [self setSectionCount:self.sectionDatas.count];
    }
    
    return _sectionCount;
}

-(void)setSectionCount:(NSUInteger)sectionCount{
    _sectionCount = sectionCount;
}

-(NSMutableArray<HDSectionData *> *)sectionDatas{
    if (!_sectionDatas) {
        _sectionDatas = [NSMutableArray array];
    }
    return _sectionDatas;
}

-(void)setSectionMakeBlock:(SectionMakeBlock)sectionMakeBlock{
    _sectionMakeBlock = sectionMakeBlock;
}

-(void)doSectionMakeBlock{
    if (self.sectionCount>0&&self.sectionMakeBlock) {
        [_sectionDatas removeAllObjects];
        HDSectionMaker * sectionMaker = nil;
        for (NSUInteger i = 0; i<self.sectionCount; i++) {
            sectionMaker = [[HDSectionMaker alloc] initWithTableView:self.tableView];
            if (self.rowHeight!=0) {
                sectionMaker.sectionData.rowHeight = self.rowHeight;
            }
            sectionMaker.sectionData.section = i;
            self.sectionMakeBlock(sectionMaker);
            [self.sectionDatas addObject:sectionMaker.sectionData];
        }
    }
}

- (void)doAddSectionMaker:(SectionMakeBlock)sectionMakerBlock{
    
    HDSectionMaker * sectionMaker = nil;
    
    sectionMaker = [[HDSectionMaker alloc] initWithTableView:self.tableView];
    if (self.rowHeight!=0) {
        sectionMaker.sectionData.rowHeight = self.rowHeight;
    }
    
    sectionMaker.sectionData.section = self.sectionCount;
    
    self.sectionCount = self.sectionCount + 1;
    
    sectionMakerBlock(sectionMaker);
    
    [self.sectionDatas addObject:sectionMaker.sectionData];
    
}

-(NSMutableDictionary *)otherDelegateBlocksDic{
    if (!_otherDelegateBlocksDic) {
        _otherDelegateBlocksDic = [NSMutableDictionary dictionary];
    }
    return _otherDelegateBlocksDic;
}

@end
