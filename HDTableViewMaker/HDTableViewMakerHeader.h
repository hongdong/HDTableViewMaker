//
//  HDTableViewDataSource.h
//  CBTableViewDataSourceDemo
//
//  Created by 洪东 on 7/15/16.
//  Copyright © 2016 Cocbin. All rights reserved.
//

#ifndef HDTableViewMakerHeader_h
#define HDTableViewMakerHeader_h

#define HDDataArr(__dataArr__) ^(){return __dataArr__;}

#define HDCellClass(_cellClass_) [_cellClass_ class]

#define HDAdapter(_adapter_) \
^(UITableViewCell *cell,id data,NSIndexPath *indexPath){ \
_adapter_ \
}

#define HDEvent(_event_) \
^(UITableView *tableView,NSIndexPath *indexPath,id data){ \
_event_ \
}


#import "UITableView+HDTableViewMaker.h"
#import "HDTableViewMaker.h"
#import "HDSectionMaker.h"
#import "HDCellMaker.h"
#import "HDBaseTableViewDataSource.h"
#import "UITableView+HDFreshUI.h"
#import "UITableView+HDLoading.h"

#endif /* HDTableViewDataSource_h */
