//
//  HDTableData.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HDSectionData;

@interface HDTableData : NSObject

@property(nonatomic, weak) UITableView * tableView;

@property(nonatomic, strong) NSMutableArray<HDSectionData *> * sectionDatas;

@property (nonatomic, assign) NSInteger sectionCount;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, assign) CGFloat rowHeight;

@end
