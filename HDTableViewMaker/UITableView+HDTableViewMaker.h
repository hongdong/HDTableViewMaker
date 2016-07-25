//
//  UITableView+HDTableViewDataSource.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDBaseTableViewDataSource,HDTableViewMaker;
@interface UITableView (HDTableViewMaker)

@property(nonatomic, strong) HDBaseTableViewDataSource * hdTableViewDataSource;

@property (nonatomic,strong) NSMutableDictionary *tableViewRegisterCell;


- (UITableView *)hd_tableViewMaker:(void (^)(HDTableViewMaker * make))tableViewMaker;

//- (UITableView *)hd_tableViewUpdate:(void (^)(HDTableViewMaker * make))tableViewMaker;


@end

__attribute__((unused)) static void commitEditing(id self, SEL cmd, UITableView * tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath * indexPath);

__attribute__((unused)) static void scrollViewDidScroll(id self, SEL cmd, UIScrollView * scrollView);

__attribute__((unused)) static void cellWillDisplay(id self, SEL cmd, UITableView *tableView,UITableViewCell *willDisplayCell,NSIndexPath *indexPath);

