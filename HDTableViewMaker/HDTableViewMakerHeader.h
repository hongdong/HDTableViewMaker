//
//

#ifndef HDTableViewMakerHeader_h
#define HDTableViewMakerHeader_h

#define HDTableViewMakerVersion 1.0.9 /*  版本号 */

#define HDDataArr(__dataArr__) ^(){return __dataArr__;}

#define HDCellClass(_cellClass_) [_cellClass_ class]

#define HDAdapter(_adapter_) \
^(__kindof UITableViewCell *cell,id data,NSIndexPath *indexPath){ \
_adapter_ \
}

#define HDEvent(_event_) \
^(__kindof UITableView *tableView,NSIndexPath *indexPath,id data){ \
_event_ \
}

#define HDSectionCount(_count_) \
^NSUInteger(UITableView *tableView){ \
_count_ \
}

#define HDAddSectionMaker(_maker_) \
tableMaker.hd_addSectionMaker(^(HDSectionMaker *sectionMaker) { \
_maker_ \
})

#define HDAddCellMaker(_maker_) \
sectionMaker.hd_addCellMaker(^(HDCellMaker *cellMaker) { \
_maker_ \
})



#import "UITableView+HDTableViewMaker.h"
#import "HDTableViewMaker.h"
#import "HDSectionMaker.h"
#import "HDCellMaker.h"
#import "HDBaseTableViewDataSource.h"
#import "UITableView+HDFreshUI.h"
#import "UITableViewCell+HDTableViewMaker.h"
#import "UITableView+HDCover.h"

#endif /* HDTableViewDataSource_h */
