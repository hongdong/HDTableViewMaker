//
//  HDTableViewMaker.h
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HDTableData.h"
#pragma mark -- Class HDTableViewMaker
@class HDTableSectionMaker;
@interface HDTableViewMaker : NSObject

@property (nonatomic, strong) HDTableData *tableData;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (instancetype)initWithTableData:(HDTableData *)tableData;


- (HDTableViewMaker * (^)(CGFloat))hd_height;

- (HDTableViewMaker * (^)(UIView * (^)()))hd_tableViewHeaderView;

- (HDTableViewMaker * (^)(UIView * (^)()))hd_tableViewFooterView;

- (HDTableViewMaker * (^)(NSInteger))hd_sectionCount;

- (HDTableViewMaker * (^)(SectionMakeBlock))hd_sectionMaker;

- (HDTableViewMaker * (^)(CellWillDisplayBlock))hd_cellWillDisplay;

- (HDTableViewMaker * (^)(CommitEditingBlock))hd_commitEditing;

- (HDTableViewMaker * (^)(ScrollViewDidScrollBlock))hd_scrollViewDidScroll;


@end
