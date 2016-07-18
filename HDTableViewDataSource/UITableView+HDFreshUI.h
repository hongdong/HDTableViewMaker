//
//  UITableView+HDFreshUI.h
//  wash4b
//
//  Created by 洪东 on 7/18/16.
//  Copyright © 2016 abnerh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "HDCommonHeader.h"



typedef NS_ENUM(NSInteger, HDFreshType) {
    HDFreshTypeFresh          = 0,
    HDFreshTypeLoadMore     = 1,
};

typedef void (^FreshBlock)(HDFreshType freshType);


@interface UITableView (HDFreshUI)

-(UITableView *)hd_addFreshHeader:(VoidBlock)headerBlock;
-(UITableView *)hd_addFreshFooter:(VoidBlock)footerBlock;
-(UITableView *)hd_addAllFresh:(FreshBlock)freshBlock;

@end
