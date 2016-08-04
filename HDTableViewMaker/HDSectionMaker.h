//
//  HDSectionMaker.h
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HDSectionData.h"
#pragma mark -- Class HDSectionMaker
@class HDTableCellMaker;
@interface HDSectionMaker : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView;

- (HDSectionMaker * (^)(GetDataBlock))hd_dataArr;


- (HDSectionMaker * (^)(NSString *))hd_headerTitle;
- (HDSectionMaker * (^)(NSString *))hd_footerTitle;

- (HDSectionMaker * (^)(UIView * (^)()))hd_headerView;
- (HDSectionMaker * (^)(UIView * (^)()))hd_footerView;

- (HDSectionMaker * (^)(CGFloat)) hd_rowHeight;

- (HDSectionMaker * (^)(CGFloat)) hd_headerHeight;
- (HDSectionMaker * (^)(CGFloat)) hd_footerHeight;



- (HDSectionMaker * (^)(NSInteger))hd_rowCount;


- (HDSectionMaker * (^)(CellMakeBlock))hd_cellMaker;

- (HDSectionMaker *)hd_cellMaker:(CellMakeBlock)cellMakeBlock;



@property(nonatomic, strong) HDSectionData * sectionData;

@end
