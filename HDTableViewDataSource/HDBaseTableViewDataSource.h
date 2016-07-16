//
//  HDBaseTableViewDataSource.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

@class HDSectionData,HDTableData;

@protocol HDBaseTableViewDataSourceProtocol<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)  HDTableData *tableData;
@end


@interface HDBaseTableViewDataSource : NSObject<HDBaseTableViewDataSourceProtocol>

@property (nonatomic, strong)  HDTableData *tableData;


@end


@interface HDSampleTableViewDataSource: HDBaseTableViewDataSource

@end