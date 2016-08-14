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
        arrowImage = [[UIImage imageWithContentsOfFile:[[self hd_tableViewMakerBundle] pathForResource:@"placeholder_fancy@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return arrowImage;
}
@end
