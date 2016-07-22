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

//- (HDSectionMaker * (^)(NSArray *))data;
- (HDSectionMaker * (^)(GetDataBlock))dataArr;


- (HDSectionMaker * (^)(NSString *))headerTitle;
- (HDSectionMaker * (^)(NSString *))footerTitle;

- (HDSectionMaker * (^)(UIView * (^)()))headerView;
- (HDSectionMaker * (^)(UIView * (^)()))footerView;

- (HDSectionMaker * (^)(CGFloat)) rowHeight;

- (HDSectionMaker * (^)(CGFloat)) headerHeight;
- (HDSectionMaker * (^)(CGFloat)) footerHeight;



- (HDSectionMaker * (^)(NSInteger))hd_rowCount;


- (HDSectionMaker * (^)(CellMakeBlock))hd_cell;



@property(nonatomic, strong) HDSectionData * sectionData;

@end
