//
//  UITableView+HDTableViewDataSource.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDBaseTableViewDataSource,HDTableViewDataSourceMaker;
@interface UITableView (HDTableViewDataSource)
@property(nonatomic, strong) HDBaseTableViewDataSource * hdTableViewDataSource;

- (void)hd_makeDataSource:(void (^)(HDTableViewDataSourceMaker * make))maker;


@end
