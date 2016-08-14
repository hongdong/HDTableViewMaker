//
//  UITableView+HDLoading.m
//  wash4c
//
//  Created by 洪东 on 8/12/16.
//  Copyright © 2016 abnerh. All rights reserved.
//

#import "UITableView+HDLoading.h"
#import "NSObject+HDAssociated.h"
#import "NSBundle+HDTableViewMaker.h"

@implementation UITableView (HDLoading)

- (void)hd_coverType:(HDTableViewCoverType)coverType{
    self.hd_tableViewCoverType = coverType;
}

- (void)hd_coverLoading{
    [self hd_coverType:HDTableViewCoverTypeLoading];
}

- (void)hd_coverEmpty{
    [self hd_coverType:HDTableViewCoverTypeEmpty];
}

- (void)hd_coverError{
    [self hd_coverType:HDTableViewCoverTypeError];
}

- (void)hd_coverEmpty:(HDTMVoidBlock)emptyBtnClickBlock{
    self.hd_emptyBtnClickBlock = emptyBtnClickBlock;
    [self hd_coverEmpty];
}

- (void)hd_coverError:(HDTMVoidBlock)errorBtnClickBlock{
    self.hd_errorBtnClickBlock = errorBtnClickBlock;
    [self hd_coverError];
}


/**
 *  GET\SET
 */

-(void)setHd_tableViewCoverType:(HDTableViewCoverType)hd_tableViewCoverType{
    if (self.hd_tableViewCoverType == hd_tableViewCoverType) {
        return;
    }
    [self hd_setAssociatedAssignObject:@(hd_tableViewCoverType) key:@selector(hd_tableViewCoverType)];
    // 一定要放在后面，因为上面的代码在设值，要设置完之后数据源的判断条件才能成立
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
    [self reloadData];
    [self reloadEmptyDataSet];
}

-(HDTableViewCoverType)hd_tableViewCoverType
{
    // 注意，取出的是一个对象，不能直接返回
    id tmp = [self hd_getAssociatedObjectWithKey:_cmd];
    NSNumber *number = tmp;
    return number.unsignedIntegerValue;
}

- (void)setHd_emptyBtnClickBlock:(HDTMVoidBlock)hd_emptyBtnClickBlock{
    [self hd_setAssociatedCopyObject:hd_emptyBtnClickBlock key:@selector(hd_emptyBtnClickBlock)];
}

- (HDTMVoidBlock)hd_emptyBtnClickBlock{
    return [self hd_getAssociatedObjectWithKey:_cmd];
}

- (void)setHd_errorBtnClickBlock:(HDTMVoidBlock)hd_errorBtnClickBlock{
    [self hd_setAssociatedCopyObject:hd_errorBtnClickBlock key:@selector(hd_errorBtnClickBlock)];
}

- (HDTMVoidBlock)hd_errorBtnClickBlock{
    return [self hd_getAssociatedObjectWithKey:_cmd];
}

/**
 *  代理
 */

#pragma mark - DZNEmptyDataSetSource
// 返回一个自定义的view（优先级最高）
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    switch (self.hd_tableViewCoverType) {
        case HDTableViewCoverTypeEmpty:
        {
            return nil;
        }
            break;
        case HDTableViewCoverTypeError:
        {
            return nil;
        }
            break;
        case HDTableViewCoverTypeLoading:
        {
            UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [activityView startAnimating];
            return activityView;
        }
            break;
        default:
            break;
    }
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    switch (self.hd_tableViewCoverType) {
        case HDTableViewCoverTypeEmpty:
        {
            return [NSBundle hd_emptyImage];
        }
            break;
        case HDTableViewCoverTypeError:
        {
            return [NSBundle hd_emptyImage];
        }
            break;
        case HDTableViewCoverTypeLoading:
        {
            return nil;
        }
            break;
        default:
            break;
    }
}
// 返回空状态显示title文字，可以返回富文本
//- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
//{
//    if (self.loading) {
//        return nil;
//    }else {
//
//        NSString *text = @"没有数据";
//
//        NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
//        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
//        paragraph.alignment = NSTextAlignmentCenter;
//
//        NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
//                                     NSForegroundColorAttributeName: [UIColor lightGrayColor],
//                                     NSParagraphStyleAttributeName: paragraph};
//
//        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//    }
//}
// 空状态下的文字详情
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
 
    switch (self.hd_tableViewCoverType) {
        case HDTableViewCoverTypeEmpty:
        {
            NSString *text = @"没有数据！您可以尝试重新获取";
            NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
            paragraph.lineBreakMode = NSLineBreakByWordWrapping;
            paragraph.alignment = NSTextAlignmentCenter;
            
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                         NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                         NSParagraphStyleAttributeName: paragraph};
            
            return [[NSAttributedString alloc] initWithString:text attributes:attributes];
        }
            break;
        case HDTableViewCoverTypeError:
        {
            NSString *text = @"请求出了点差错！您可以尝试重新获取";
            NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
            paragraph.lineBreakMode = NSLineBreakByWordWrapping;
            paragraph.alignment = NSTextAlignmentCenter;
            
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                         NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                         NSParagraphStyleAttributeName: paragraph};
            
            return [[NSAttributedString alloc] initWithString:text attributes:attributes];
        }
            break;
        case HDTableViewCoverTypeLoading:
        {
            return nil;
        }
            break;
        default:
            break;
    }
}
// 返回最下面按钮上的文字
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    
    switch (self.hd_tableViewCoverType) {
        case HDTableViewCoverTypeEmpty:
        {
            UIColor *textColor = nil;
            // 某种状态下的颜色
            UIColor *colorOne = [UIColor colorWithRed:253/255.0f green:120/255.0f blue:76/255.0f alpha:1];
            UIColor *colorTow = [UIColor colorWithRed:247/255.0f green:188/255.0f blue:169/255.0f alpha:1];
            // 判断外部是否有设置
            textColor = state == UIControlStateNormal ? colorOne : colorTow;
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f],
                                         NSForegroundColorAttributeName: textColor};
            
            return [[NSAttributedString alloc] initWithString:@"再次刷新" attributes:attributes];
        }
            break;
        case HDTableViewCoverTypeError:
        {
            UIColor *textColor = nil;
            // 某种状态下的颜色
            UIColor *colorOne = [UIColor colorWithRed:253/255.0f green:120/255.0f blue:76/255.0f alpha:1];
            UIColor *colorTow = [UIColor colorWithRed:247/255.0f green:188/255.0f blue:169/255.0f alpha:1];
            // 判断外部是否有设置
            textColor = state == UIControlStateNormal ? colorOne : colorTow;
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f],
                                         NSForegroundColorAttributeName: textColor};
            
            return [[NSAttributedString alloc] initWithString:@"再次刷新" attributes:attributes];
        }
            break;
        case HDTableViewCoverTypeLoading:
        {
            return nil;
        }
            break;
        default:
            break;
    }
    
}
// 返回试图的垂直位置（调整整个试图的垂直位置）
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return 0.0;
}
#pragma mark - DZNEmptyDataSetDelegate Methods
// 返回是否显示空状态的所有组件，默认:YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}
// 返回是否允许交互，默认:YES
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    // 只有非加载状态能交互
    switch (self.hd_tableViewCoverType) {
        case HDTableViewCoverTypeEmpty:
        {
            return YES;
        }
            break;
        case HDTableViewCoverTypeError:
        {
            return YES;
        }
            break;
        case HDTableViewCoverTypeLoading:
        {
            return NO;
        }
            break;
        default:
            break;
    }
    return NO;
}
// 返回是否允许滚动，默认:YES
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return NO;
}
// 返回是否允许空状态下的图片进行动画，默认:NO
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return YES;
}
//  点击空状态下的view会调用
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    // 暂时不响应
    //    if (self.loadingClick) {
    //        self.loadingClick();
    //        [self reloadEmptyDataSet];
    //    }
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    switch (self.hd_tableViewCoverType) {
        case HDTableViewCoverTypeEmpty:
        {
            if (self.hd_emptyBtnClickBlock) {
                self.hd_emptyBtnClickBlock();
                [self reloadEmptyDataSet];
            }
        }
            break;
        case HDTableViewCoverTypeError:
        {
            if (self.hd_errorBtnClickBlock) {
                self.hd_errorBtnClickBlock();
                [self reloadEmptyDataSet];
            }
        }
            break;
        case HDTableViewCoverTypeLoading:
        {
            
        }
            break;
        default:
            break;
    }
}

@end
