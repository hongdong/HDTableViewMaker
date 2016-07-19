//
//  HDTableSectionMaker.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HDSectionData.h"
#pragma mark -- Class HDTableSectionMaker
@class HDTableCellMaker;
@interface HDTableSectionMaker : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView;

- (HDTableSectionMaker * (^)(NSArray *))data;
- (HDTableSectionMaker * (^)(GetDataBlock))dataTest;


- (HDTableSectionMaker * (^)(NSString *))headerTitle;
- (HDTableSectionMaker * (^)(NSString *))footerTitle;

- (HDTableSectionMaker * (^)(UIView * (^)()))headerView;
- (HDTableSectionMaker * (^)(UIView * (^)()))footerView;

- (HDTableSectionMaker * (^)(CGFloat)) rowHeight;

- (HDTableSectionMaker * (^)(CGFloat)) headerHeight;
- (HDTableSectionMaker * (^)(CGFloat)) footerHeight;



- (HDTableSectionMaker * (^)(NSInteger))hd_rowCount;


- (HDTableSectionMaker * (^)(CellMakeBlock))hd_cell;



@property(nonatomic, strong) HDSectionData * sectionData;

@end
