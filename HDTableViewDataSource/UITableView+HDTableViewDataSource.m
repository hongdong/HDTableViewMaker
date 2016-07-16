//
//  UITableView+HDTableViewDataSource.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "UITableView+HDTableViewDataSource.h"
#import "HDBaseTableViewDataSource.h"
#import <objc/runtime.h>
#import "HDTableViewDataSourceMaker.h"
#import "HDTableData.h"
@implementation UITableView (HDTableViewDataSource)

- (HDBaseTableViewDataSource *)hdTableViewDataSource {
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setHdTableViewDataSource:(HDBaseTableViewDataSource *)hdTableViewDataSource{
    objc_setAssociatedObject(self,@selector(hdTableViewDataSource),hdTableViewDataSource,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hd_makeDataSource:(void (^)(HDTableViewDataSourceMaker *))maker{
    HDTableViewDataSourceMaker * make = [[HDTableViewDataSourceMaker alloc] initWithTableView:self];
    maker(make);
    Class DataSourceClass = [HDBaseTableViewDataSource class];
    id<HDBaseTableViewDataSourceProtocol> ds = (id<HDBaseTableViewDataSourceProtocol>) [DataSourceClass  new];
    ds.tableData = make.tableData;
    self.hdTableViewDataSource = ds;
    self.dataSource = ds;
    self.delegate = ds;
}

@end
