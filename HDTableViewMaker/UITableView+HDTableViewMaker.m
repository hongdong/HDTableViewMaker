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

void HDExchangeImplementations(Class class, SEL newSelector, SEL oldSelector) {
    Method oldMethod = class_getInstanceMethod(class, newSelector);
    Method newMethod = class_getInstanceMethod(class, oldSelector);
    method_exchangeImplementations(oldMethod, newMethod);
};

@implementation UITableView (HDTableViewMaker)

+ (void)load {
    // All methods that trigger height cache's invalidation
    SEL selectors[] = {
        @selector(reloadData),
        @selector(insertSections:withRowAnimation:),
        @selector(deleteSections:withRowAnimation:),
        @selector(reloadSections:withRowAnimation:),
        @selector(moveSection:toSection:),
        @selector(insertRowsAtIndexPaths:withRowAnimation:),
        @selector(deleteRowsAtIndexPaths:withRowAnimation:),
        @selector(reloadRowsAtIndexPaths:withRowAnimation:),
        @selector(moveRowAtIndexPath:toIndexPath:)
    };
    
    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"hd_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        HDExchangeImplementations(self, originalSelector, swizzledSelector);
    }
}

- (void) hd_reloadData{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_reloadData];
}

- (void)hd_moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
}

- (void)hd_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)hd_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)hd_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)hd_moveSection:(NSInteger)section toSection:(NSInteger)newSection{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_moveSection:section toSection:newSection];
}

- (void)hd_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_reloadSections:sections withRowAnimation:animation];
}


- (void)hd_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_insertSections:sections withRowAnimation:animation];
}

- (void)hd_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self.hdTableViewDataSource.tableData doSectionMakeBlock];
    [self hd_insertSections:sections withRowAnimation:animation];
}

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
    [tableViewmaker.tableData doSectionMakeBlock];
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

