//
//  HDCellData.m
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import "HDCellData.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "UITableViewCell+HDTableViewMaker.h"
#import "UITableView+HDTableViewMaker.h"

@implementation HDCellData

-(UITableViewCell *)getReturnCell{
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:self.indexPath];
    //NSLog(@"adaptBlock %@", [adaptBlock isEqual:nil]);
    cell.indexPath = self.indexPath;
    if(_adapter) {
        _adapter(cell,_data,_indexPath);
    }
    return cell;
}
/**
 *  GET\SET
 *
 */
-(NSString *)cellIdentifier{
    if (!_cellIdentifier) {
        _cellIdentifier = NSStringFromClass(_cell);
    }
    return _cellIdentifier;
}

-(void)setCell:(Class)cell{
    _cell = cell;
    if (!self.tableView.tableViewRegisterCell[self.cellIdentifier]) {//如果没有注册过
        UINib *nib = [UINib nibWithNibName:self.cellIdentifier bundle:nil];
        if (self.cellRegisterType==HDCellRegisterTypeClass) {
            [self.tableView registerClass:[cell class] forCellReuseIdentifier:self.cellIdentifier];
        }else{
            [self.tableView registerNib:nib forCellReuseIdentifier:self.cellIdentifier];
        }

        [self.tableView.tableViewRegisterCell setValue:@(YES) forKey:self.cellIdentifier];
    }
}

-(CGFloat)rowHeight{
    if (self.isAutoHeight) {
        _rowHeight = [self.tableView fd_heightForCellWithIdentifier:self.cellIdentifier cacheByIndexPath:_indexPath configuration:^(id cell) {
            self.adapter(cell,self.data,self.indexPath);
        }];
    }
    return _rowHeight;
}
@end
