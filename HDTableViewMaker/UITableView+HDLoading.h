//
//  UITableView+HDLoading.h
//  wash4c
//
//  Created by 洪东 on 8/12/16.
//  Copyright © 2016 abnerh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"
#import "HDTMCommonHeader.h"


typedef NS_ENUM(NSInteger,HDTableViewCoverType) {
    HDTableViewCoverTypeEmpty = 1,
    HDTableViewCoverTypeError = 2,
    HDTableViewCoverTypeLoading = 3
};

@interface UITableView (HDLoading)<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, assign) HDTableViewCoverType hd_tableViewCoverType;

@property (nonatomic, copy) HDTMVoidBlock hd_emptyBtnClickBlock;

@property (nonatomic, copy) HDTMVoidBlock hd_errorBtnClickBlock;

- (void)hd_coverType:(HDTableViewCoverType)coverType;

- (void)hd_coverLoading;

- (void)hd_coverEmpty;

- (void)hd_coverError;

- (void)hd_coverEmpty:(HDTMVoidBlock)emptyBtnClickBlock;

- (void)hd_coverError:(HDTMVoidBlock)errorBtnClickBlock;

@end
