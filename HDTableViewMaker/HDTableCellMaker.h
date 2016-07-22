//
//  HDTableCellMaker.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HDCellData.h"
@class HDCellData;
@interface HDTableCellMaker : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView;


@property (nonatomic, strong) HDCellData *cellData;

- (HDTableCellMaker * (^)(CGFloat)) rowHeight;

- (HDTableCellMaker * (^)())autoHeight;

- (HDTableCellMaker * (^)(Class))cell;

- (HDTableCellMaker * (^)(id))data;

- (HDTableCellMaker * (^)(CellAdapterBlock))adapter;

- (HDTableCellMaker * (^)(CellEventBlock))event;

@end
