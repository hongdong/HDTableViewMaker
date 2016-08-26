//
//  NSBundle+HDTableViewMaker.m
//  HDTableViewMakerDemo
//
//  Created by Abner on 16/8/14.
//  Copyright © 2016年 Abner. All rights reserved.
//

#import "NSBundle+HDTableViewMaker.h"

@implementation NSBundle (HDTableViewMaker)
+ (instancetype)hd_tableViewMakerBundle
{
    static NSBundle *tableViewMakerBundle = nil;
    if (tableViewMakerBundle == nil) {
        NSString * bundlePath = [[ NSBundle mainBundle] pathForResource:@"HDTableViewMaker" ofType :@"bundle"];
        tableViewMakerBundle = [NSBundle bundleWithPath:bundlePath];
    }
    return tableViewMakerBundle;
}

+ (UIImage *)hd_emptyImage
{
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage = [[UIImage imageWithContentsOfFile:[[self hd_tableViewMakerBundle] pathForResource:@"hd_tm_empty_icon@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return arrowImage;
}
+ (UIImage *)hd_errorImage
{
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage = [[UIImage imageWithContentsOfFile:[[self hd_tableViewMakerBundle] pathForResource:@"hd_tm_error_icon@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return arrowImage;
}
@end
