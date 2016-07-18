//
//  HDSectionData.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HDTableCellMaker.h"

typedef  NSInteger (^NumberOfRowsBlock)(NSInteger section);
typedef void (^CellMakeBlock)(HDTableCellMaker * sectionMaker);

@interface HDSectionData : NSObject

@property(nonatomic, strong) NSMutableArray<HDCellData *> * cellDatas;

@property(nonatomic, weak) UITableView * tableView;

@property (nonatomic, strong) NSArray *modelDatas;

@property(nonatomic, strong) NSString * headerTitle;
@property(nonatomic, strong) NSString * footerTitle;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;

@property(nonatomic, strong) UIView * headerView;
@property(nonatomic, strong) UIView * footerView;

@property(nonatomic, assign) CGFloat rowHeight;


@property (nonatomic, assign) NSInteger section;

@property (nonatomic, assign) NSInteger rowCount;



@property(nonatomic, copy) NumberOfRowsBlock numberOfRowsBlock;

@property(nonatomic, copy) CellMakeBlock cellMakeBlock;



@end
