//
//  HDTableSectionMaker.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#pragma mark -- Class HDTableSectionMaker
@class HDSectionData,HDTableCellMaker;
@interface HDTableSectionMaker : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView;

- (HDTableSectionMaker * (^)(NSArray *))data;

- (HDTableSectionMaker * (^)(NSString *))headerTitle;
- (HDTableSectionMaker * (^)(NSString *))footerTitle;

- (HDTableSectionMaker * (^)(UIView * (^)()))headerView;
- (HDTableSectionMaker * (^)(UIView * (^)()))footerView;

- (HDTableSectionMaker * (^)(CGFloat)) rowHeight;

- (HDTableSectionMaker * (^)(NSInteger))hd_rowCount;


- (HDTableSectionMaker * (^)(void (^)(HDTableCellMaker * cellMaker)))hd_cell;



@property(nonatomic, strong) HDSectionData * sectionData;

@end
