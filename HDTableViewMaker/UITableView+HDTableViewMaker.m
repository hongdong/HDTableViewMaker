//
//  UITableView+HDTableViewDataSource.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "UITableView+HDTableViewMaker.h"
#import "HDBaseTableViewDataSource.h"
#import <objc/runtime.h>
#import "HDTableViewMaker.h"
#import "HDTableData.h"
@implementation UITableView (HDTableViewMaker)

- (HDBaseTableViewDataSource *)hdTableViewDataSource {
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setHdTableViewDataSource:(HDBaseTableViewDataSource *)hdTableViewDataSource{
    objc_setAssociatedObject(self,@selector(hdTableViewDataSource),hdTableViewDataSource,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = hdTableViewDataSource;
    self.dataSource = hdTableViewDataSource;
}

- (NSMutableDictionary *)tableViewRegisterCell
{
    NSMutableDictionary *dic = objc_getAssociatedObject(self, @selector(tableViewRegisterCell));
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
        [self setTableViewRegisterCell:dic];
    }
    return dic;
}

- (void)setTableViewRegisterCell:(NSMutableDictionary *)tableViewRegisterCell{
    objc_setAssociatedObject(self, @selector(tableViewRegisterCell), tableViewRegisterCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//- (UITableView *)hd_tableViewUpdate:(void (^)(HDTableViewMaker * make))tableViewMakerBlock{
//    if (self.hdTableViewDataSource) {
//        HDTableData *tableData = self.hdTableViewDataSource.tableData;
//        HDTableViewMaker * tableViewmaker = [[HDTableViewMaker alloc] initWithTableData:tableData];
//        tableViewMakerBlock(tableViewmaker);
//
//    }else{
//        return [self hd_tableViewMaker:tableViewMakerBlock];
//    }
//    return self;
//}


- (UITableView *)hd_tableViewMaker:(void (^)(HDTableViewMaker *))tableViewMakerBlock{
    HDTableViewMaker * tableViewmaker = [[HDTableViewMaker alloc] initWithTableView:self];
    tableViewMakerBlock(tableViewmaker);
    Class DataSourceClass = [HDBaseTableViewDataSource class];
//=============添加额外的代理===============
    
    if (tableViewmaker.tableData.otherDelegateBlocksDic[NSStringFromSelector(@selector(tableView:commitEditingStyle:forRowAtIndexPath:))]) {
        class_addMethod(DataSourceClass,@selector(tableView:commitEditingStyle:forRowAtIndexPath:),(IMP)commitEditing,"v@:@@@");
    }
    
    if (tableViewmaker.tableData.otherDelegateBlocksDic[NSStringFromSelector(@selector(scrollViewDidScroll:))]) {
        class_addMethod(DataSourceClass,@selector(scrollViewDidScroll:),(IMP)scrollViewDidScroll,"v@:@@@");
    }
    
    if (tableViewmaker.tableData.otherDelegateBlocksDic[NSStringFromSelector(@selector(tableView:willDisplayCell:forRowAtIndexPath:))]) {
        class_addMethod(DataSourceClass,@selector(tableView:willDisplayCell:forRowAtIndexPath:),(IMP)cellWillDisplay,"v@:@@@");
    }

//==========================
    id<HDBaseTableViewDataSourceProtocol> dataSource = (id<HDBaseTableViewDataSourceProtocol>) [DataSourceClass  new];
    dataSource.tableData = tableViewmaker.tableData;
    self.hdTableViewDataSource = dataSource;

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

