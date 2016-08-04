//
//  HDCellMaker.h
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HDCellData.h"
@class HDCellData;
@interface HDCellMaker : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView;


@property (nonatomic, strong) HDCellData *cellData;

- (NSIndexPath *) indexPath;

- (HDCellMaker * (^)(CGFloat)) hd_rowHeight;

- (HDCellMaker * (^)())hd_autoHeight;

- (HDCellMaker * (^)(Class))hd_cellClass;

- (HDCellMaker * (^)(Class))hd_cellClassXib;

- (HDCellMaker * (^)(id))hd_data;

- (HDCellMaker * (^)(CellAdapterBlock))hd_adapter;

- (HDCellMaker * (^)(CellEventBlock))hd_event;

- (HDCellMaker * (^)(Class,CellAdapterBlock))hd_cellClassAndAdapter;


@end
