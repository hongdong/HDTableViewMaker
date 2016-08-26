//
//  NSBundle+HDTableViewMaker.h
//  HDTableViewMakerDemo
//
//  Created by Abner on 16/8/14.
//  Copyright © 2016年 Abner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (HDTableViewMaker)
+ (instancetype)hd_tableViewMakerBundle;
+ (UIImage *)hd_emptyImage;
+ (UIImage *)hd_errorImage;
@end
