//
//  UITableView+HDFreshUI.h
//  wash4b
//
//  Created by 洪东 on 7/18/16.
//  Copyright © 2016 abnerh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

typedef void(^HDVoidBlock)();

typedef NS_ENUM(NSInteger, HDFreshType) {
    HDFreshTypeFresh          = 0,
    HDFreshTypeLoadMore     = 1,
};

typedef void (^FreshBlock)(HDFreshType freshType);


@interface UITableView (HDFreshUI)

-(UITableView *)hd_addFreshHeader:(HDVoidBlock)headerBlock;
-(UITableView *)hd_addFreshFooter:(HDVoidBlock)footerBlock;
-(UITableView *)hd_addAllFresh:(FreshBlock)freshBlock;

-(void)hd_endFreshing:(BOOL)existMoreData;

@end
