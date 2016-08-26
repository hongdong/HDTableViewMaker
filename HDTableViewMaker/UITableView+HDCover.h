//
//  UITableView+HDCover.h
//  HDTableViewMakerDemo
//
//  Created by 洪东 on 8/26/16.
//  Copyright © 2016 Abner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDTMCommonHeader.h"

typedef NS_ENUM(NSInteger,HDTableViewCoverType) {
    HDTableViewCoverTypeNull = 0,
    HDTableViewCoverTypeEmpty = 1,
    HDTableViewCoverTypeError = 2,
    HDTableViewCoverTypeLoading = 3
};


@interface UITableView (HDCover)

@property (nonatomic, assign) HDTableViewCoverType hd_tableViewCoverType;

@property (nonatomic, copy) HDTMVoidBlock hd_emptyBtnClickBlock;

@property (nonatomic, copy) HDTMVoidBlock hd_errorBtnClickBlock;

- (void) hd_coverLoading;

- (void) hd_coverEmpty;

- (void) hd_coverError;

- (void) hd_coverDismiss;

- (void) hd_coverEmpty:(HDTMVoidBlock)emptyBtnClickBlock;

- (void) hd_coverError:(HDTMVoidBlock)errorBtnClickBlock;

@end
