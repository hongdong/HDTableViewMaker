//
//  HDTableData.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HDSectionData,HDSectionMaker;

typedef void (^CellWillDisplayBlock)(UITableView *tableView,UITableViewCell *willDisplayCell,NSIndexPath *indexPath);

typedef void (^CommitEditingBlock)(UITableView * tableView,UITableViewCellEditingStyle editingStyle,NSIndexPath * indexPath);

typedef void (^ScrollViewDidScrollBlock)(UIScrollView *scrollView);

typedef void (^SectionMakeBlock)(HDSectionMaker * sectionMaker);

@interface HDTableData : NSObject

-(instancetype)initWithTableView:(UITableView *)tableView;

@property(nonatomic, weak) UITableView * tableView;

@property(nonatomic, strong) NSMutableArray<HDSectionData *> * sectionDatas;

@property (nonatomic, assign) NSUInteger sectionCount;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, copy)  SectionMakeBlock sectionMakeBlock;

@property(nonatomic, strong) NSMutableDictionary * otherDelegateBlocksDic;

@end
