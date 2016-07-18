//
//  UITableView+HDFreshUI.m
//  wash4b
//
//  Created by 洪东 on 7/18/16.
//  Copyright © 2016 abnerh. All rights reserved.
//

#import "UITableView+HDFreshUI.h"

@implementation UITableView (HDFreshUI)

-(UITableView *)hd_addFreshHeader:(VoidBlock)headerBlock{
    if (headerBlock) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            headerBlock();
        }];
    }
    return self;
}
-(UITableView *)hd_addFreshFooter:(VoidBlock)footerBlock{
    if (footerBlock) {
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            footerBlock();
        }];
        [self.mj_footer setAutomaticallyHidden:YES];
    }
    return self;
}
-(UITableView *)hd_addAllFresh:(FreshBlock)freshBlock{
    
   [self hd_addFreshHeader:^{
       freshBlock(HDFreshTypeFresh);
   }];
    
    [self hd_addFreshFooter:^{
        freshBlock(HDFreshTypeLoadMore);
    }];
    return self;
}
@end
