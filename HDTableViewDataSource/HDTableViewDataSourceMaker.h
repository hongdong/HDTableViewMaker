//
//  HDTableViewDataSourceMaker.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#pragma mark -- Class HDTableViewDataSourceMaker
@class HDTableSectionMaker,HDTableData;;
@interface HDTableViewDataSourceMaker : NSObject

@property (nonatomic, strong) HDTableData *tableData;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (HDTableViewDataSourceMaker * (^)(CGFloat))hd_height;

- (HDTableViewDataSourceMaker * (^)(UIView * (^)()))hd_tableViewHeaderView;

- (HDTableViewDataSourceMaker * (^)(UIView * (^)()))hd_tableViewFooterView;

- (HDTableViewDataSourceMaker * (^)(NSInteger))hd_sectionCount;

- (HDTableViewDataSourceMaker * (^)(void (^)(HDTableSectionMaker * sectionMaker)))hd_section;

@end
