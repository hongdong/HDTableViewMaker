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

- (UITableView *)hd_makeDataSource:(void (^)(HDTableViewDataSourceMaker *))maker{
    HDTableViewDataSourceMaker * make = [[HDTableViewDataSourceMaker alloc] initWithTableView:self];
    maker(make);
    Class DataSourceClass = [HDBaseTableViewDataSource class];
//=============添加额外的代理===============
    
    if (make.tableData.otherDelegateBlocksDic[NSStringFromSelector(@selector(tableView:commitEditingStyle:forRowAtIndexPath:))]) {
        class_addMethod(DataSourceClass,@selector(tableView:commitEditingStyle:forRowAtIndexPath:),(IMP)commitEditing,"v@:@@@");
    }
    
    if (make.tableData.otherDelegateBlocksDic[NSStringFromSelector(@selector(scrollViewDidScroll:))]) {
        class_addMethod(DataSourceClass,@selector(scrollViewDidScroll:),(IMP)scrollViewDidScroll,"v@:@@@");
    }
    
    if (make.tableData.otherDelegateBlocksDic[NSStringFromSelector(@selector(tableView:willDisplayCell:forRowAtIndexPath:))]) {
        class_addMethod(DataSourceClass,@selector(tableView:willDisplayCell:forRowAtIndexPath:),(IMP)cellWillDisplay,"v@:@@@");
    }

//==========================
    id<HDBaseTableViewDataSourceProtocol> ds = (id<HDBaseTableViewDataSourceProtocol>) [DataSourceClass  new];
    ds.tableData = make.tableData;
    self.hdTableViewDataSource = ds;
    self.dataSource = ds;
    self.delegate = ds;
    return self;
}

@end

static void commitEditing(id self, SEL cmd, UITableView *tableView,UITableViewCellEditingStyle editingStyle,NSIndexPath * indexPath)
{
    HDBaseTableViewDataSource * ds = self;
    CommitEditingBlock block = ds.tableData.otherDelegateBlocksDic[NSStringFromSelector(cmd)];
    if(block) {
        block(tableView,editingStyle,indexPath);
    }
}

static void scrollViewDidScroll(id self, SEL cmd, UIScrollView * scrollView) {
    HDBaseTableViewDataSource * ds = self;
    ScrollViewDidScrollBlock block = ds.tableData.otherDelegateBlocksDic[NSStringFromSelector(cmd)];
    if(block) {
        block(scrollView);
    }
};

static void cellWillDisplay(id self, SEL cmd, UITableView *tableView,UITableViewCell *willDisplayCell,NSIndexPath *indexPath){
    HDBaseTableViewDataSource * ds = self;
    CellWillDisplayBlock block = ds.tableData.otherDelegateBlocksDic[NSStringFromSelector(cmd)];
    if(block) {
        block(tableView,willDisplayCell,indexPath);
    }
}

