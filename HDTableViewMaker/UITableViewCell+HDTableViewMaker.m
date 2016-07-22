//
//  UITableViewCell+HDTableViewDataSource.m
//  wash4b
//
//  Created by 洪东 on 7/20/16.
//  Copyright © 2016 abnerh. All rights reserved.
//

#import "UITableViewCell+HDTableViewMaker.h"
#import <objc/runtime.h>

@implementation UITableViewCell (HDTableViewMaker)
-(NSIndexPath *)indexPath{
    NSIndexPath *indexPath=objc_getAssociatedObject(self, _cmd);
    return indexPath;
}
-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
