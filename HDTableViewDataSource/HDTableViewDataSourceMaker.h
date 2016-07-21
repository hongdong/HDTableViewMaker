//
//  HDTableViewDataSourceMaker.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HDTableData.h"
#pragma mark -- Class HDTableViewDataSourceMaker
@class HDTableSectionMaker;;
@interface HDTableViewDataSourceMaker : NSObject

@property (nonatomic, strong) HDTableData *tableData;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (HDTableViewDataSourceMaker * (^)(CGFloat))hd_height;

- (HDTableViewDataSourceMaker * (^)(UIView * (^)()))hd_tableViewHeaderView;

- (HDTableViewDataSourceMaker * (^)(UIView * (^)()))hd_tableViewFooterView;

- (HDTableViewDataSourceMaker * (^)(NSInteger))hd_sectionCount;

- (HDTableViewDataSourceMaker * (^)(SectionMakeBlock))hd_section;

- (HDTableViewDataSourceMaker * (^)(CellWillDisplayBlock))hd_cellWillDisplay;

- (HDTableViewDataSourceMaker * (^)(CommitEditingBlock))hd_commitEditing;

- (HDTableViewDataSourceMaker * (^)(ScrollViewDidScrollBlock))hd_scrollViewDidScroll;


@end
