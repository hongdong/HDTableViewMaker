//
//  HDSectionMaker.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDSectionMaker.h"
#import "HDSectionData.h"
#import "HDCellMaker.h"

@implementation HDSectionMaker

- (instancetype)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.sectionData.tableView = tableView;
    }
    return self;
    
}

//- (HDSectionMaker * (^)(NSArray *))data {
//    return ^HDSectionMaker *(NSArray * datas) {
//        self.sectionData.modelDatas = datas;
//        return self;
//    };
//}

- (NSUInteger) section{
    return self.sectionData.section;
}

- (HDSectionMaker * (^)(NSString *))hd_headerTitle {
    return ^HDSectionMaker *(NSString * title) {
        self.sectionData.headerTitle = title;
        return self;
    };
}

- (HDSectionMaker * (^)(NSString *))hd_footerTitle {
    return ^HDSectionMaker *(NSString * title) {
        self.sectionData.footerTitle = title;
        return self;
    };
}

- (HDSectionMaker * (^)(CGFloat))hd_rowHeight{
    return ^HDSectionMaker *(CGFloat height){
        self.sectionData.rowHeight = height;
        return self;
    };
}

- (HDSectionMaker * (^)(CGFloat))hd_headerHeight{
    return ^HDSectionMaker *(CGFloat height){
        self.sectionData.headerHeight = height;
        return self;
    };
}

- (HDSectionMaker * (^)(CGFloat))hd_footerHeight{
    return ^HDSectionMaker *(CGFloat height){
        self.sectionData.footerHeight = height;
        return self;
    };
}


- (HDSectionMaker * (^)(UIView * (^)()))hd_headerView {
    return ^HDSectionMaker *(UIView * (^view)()) {
        self.sectionData.headerView = view();
        return self;
    };
}

- (HDSectionMaker * (^)(GetDataBlock))hd_dataArr{
    return ^HDSectionMaker *(GetDataBlock getDataBlock){
        self.sectionData.getDataBlock = getDataBlock;
        [self.sectionData doCellMakerBlock];
        return self;
    };
}

- (HDSectionMaker * (^)(UIView * (^)()))hd_footerView {
    return ^HDSectionMaker *(UIView * (^view)()) {
        self.sectionData.footerView = view();
        return self;
    };
}

- (HDSectionMaker * (^)(NSInteger))hd_rowCount{
    return ^HDSectionMaker *(NSInteger rowCount){
        self.sectionData.rowCount = rowCount;
        [self.sectionData doCellMakerBlock];
        return self;
    };
}

- (HDSectionMaker * (^)(CellMakeBlock))hd_cellMaker{
    return ^HDSectionMaker *(CellMakeBlock cellMakerBlock){
        self.sectionData.cellMakeBlock = cellMakerBlock;
        [self.sectionData doCellMakerBlock];
        return self;
    };
}
- (HDSectionMaker *)hd_cellMaker:(CellMakeBlock)cellMakeBlock{
    self.sectionData.cellMakeBlock = cellMakeBlock;
    [self.sectionData doCellMakerBlock];
    return self;
}

- (HDSectionMaker *)hd_addCellMaker:(CellMakeBlock)cellMakeBlock{
    [self.sectionData doAddCellMakerBlock:cellMakeBlock];
    return self;
}

/**
 *  GET
 */
- (HDSectionData *)sectionData {
    if (! _sectionData) {
        _sectionData = [HDSectionData new];
    }
    return _sectionData;
}

@end
