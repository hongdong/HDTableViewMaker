//
//  UITableViewCell+HDTableViewDataSource.m
//  wash4b
//
//  Created by 洪东 on 7/20/16.
//  Copyright © 2016 abnerh. All rights reserved.
//

#import "UITableViewCell+HDTableViewMaker.h"
#import "NSObject+HDAssociated.h"

@implementation UITableViewCell (HDTableViewMaker)
-(NSIndexPath *)indexPath{
    NSIndexPath *indexPath=objc_getAssociatedObject(self, _cmd);
    return indexPath;
}
-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITableView *)tableView
{
    UITableView *curTableView = [self hd_getAssociatedObjectWithKey:_cmd];
    if (curTableView) return curTableView;
    
//    curTableView = [self hd_findSupview:@"UITableView"];
//    if (curTableView) {
//        self.tableView = curTableView;
//    }
    return curTableView;
}

- (void)setTableView:(UITableView *)tableView
{
    [self hd_setAssociatedAssignObject:tableView key:@selector(tableView)];
}

- (void)reloadRow:(UITableViewRowAnimation)animation{
    [self.tableView reloadRowsAtIndexPaths:@[self.indexPath] withRowAnimation:animation];
}
@end
