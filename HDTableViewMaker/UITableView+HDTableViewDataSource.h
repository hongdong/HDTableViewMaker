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

- (UITableView *)hd_makeDataSource:(void (^)(HDTableViewDataSourceMaker * make))maker;


@end

__attribute__((unused)) static void commitEditing(id self, SEL cmd, UITableView * tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath * indexPath);

__attribute__((unused)) static void scrollViewDidScroll(id self, SEL cmd, UIScrollView * scrollView);

__attribute__((unused)) static void cellWillDisplay(id self, SEL cmd, UITableView *tableView,UITableViewCell *willDisplayCell,NSIndexPath *indexPath);

