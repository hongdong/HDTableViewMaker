# HDTableViewDataSource 中文文档

![demo](media/demo.jpg)

只需一行代码，快速为`UITableView`创建`Delegate`和`DataSource`。

## 简介

`HDTableViewDataSource`是一个轻量级的用于快速创建`UITableView`的`DataSource`和`Delegate`的框架。它提供了一些方便的API，帮助用户以一种快速和有逻辑的方式创建`DataSource`和`Delegate`。


## 为什么使用
我们在开发App的时候，往往花费大量的时间在为`UITableView`写`DataSource`和`Delegate`上。而它们往往是一些重复性的并且难以维护的代码。因为它们分散在了各个代理方法中，当我们需要进行修改时，需要到各个代理方法中依次修改它们。

而`HDTableViewDataSource`改变了这种书写方式，它提供一套简练的API，使得我们可以快速地书写有逻辑的，便于维护的代码。

为了让大家看到使用该框架的优势，我们来做一个对比：

使用原生方式创建`DataSource`和`Delegate`:

``` objective-c

// Native vision

// define a enum to split section

typedef NS_ENUM(NSInteger, SectionNameDefine) {
    SECTION_ONE,
    SECTION_TWO,
    SECTION_THREE,
    SECTION_FOUR,
    //...
    COUNT_OF_STORE_SECTION
};

// define identifier for section

#define IDENTIFIER_ONE  @"IDENTIFIER_ONE"
#define IDENTIFIER_TWO  @"IDENTIFIER_TWO"
#define IDENTIFIER_THREE  @"IDENTIFIER_THREE"
#define IDENTIFIER_FOUR @"IDENTIFIER_FOUR"
//...


// register cell class for section

[self.tableView registerClass:[OneCell class] forCellWithReuseIdentifier:IDENTIFIER_ONE];
[self.tableView registerClass:[TwoCell class] forCellWithReuseIdentifier:IDENTIFIER_TWO];
[self.tableView registerClass:[ThreeCell class] forCellWithReuseIdentifier:IDENTIFIER_THREE];
[self.tableView registerClass:[FourCell class] forCellWithReuseIdentifier:IDENTIFIER_FOUR];


// implementation datasource protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return COUNT_OF_STORE_SECTION;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray*)self.data[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    switch(section) {
        case SECTION_ONE:
        // to do something
            return cell;
        case SECTION_TWO:
        // to do something
            return cell;
        case SECTION_THREE:
        // to do something
            return cell;
            
            //...
    }
    
    return cell;
}
// ...

```
可以看到，步骤多而繁琐，维护十分困难。
而使用`HDTableViewDataSource`后

``` objective-c
    [_mainTable hd_makeDataSource:^(HDTableViewDataSourceMaker *dataSourceMaker) {
        
        dataSourceMaker
        .hd_section(^(HDTableSectionMaker * sectionMaker){
            
            sectionMaker
            .data(self.dataArr)
            .hd_cell(^(HDTableCellMaker *cellMaker){
                
                cellMaker
                .cell([HDTableViewCell class])
                .adapter(^(HDTableViewCell *cell,id data,NSIndexPath *indexPath){
                    cell.title = data;
                }).autoHeight();
                
            });
        });
    }];
```
代码变得简练而富有层次感，更加符合人类的思维方式。

## 用法

### 安装

使用`cocoapods`下载

``` ruby
pod 'HDTableViewDataSource'
```

### 导入包

``` objective-c
#import <HDTableViewDataSource/HDTableViewDataSource.h>
```

### 创建`DataSource`和`Delegate`

``` objective-c
    [_mainTable hd_makeDataSource:^(HDTableViewDataSourceMaker *dataSourceMaker) {
        
        dataSourceMaker
        .hd_section(^(HDTableSectionMaker * sectionMaker){
            
            sectionMaker
            .data(self.dataArr)
            .hd_cell(^(HDTableCellMaker *cellMaker){
                
                cellMaker
                .cell([HDTableViewCell class])
                .adapter(^(HDTableViewCell *cell,id data,NSIndexPath *indexPath){
                    cell.title = data;
                }).autoHeight();
                
            });
        });
    }];
```

#### HDTableViewDataSourceMaker支持设置以下属性：
**注意这些属性都是针对整个UITableView**

#### hd_sectionCount
用户配置这个tableView中存在几个的section
``` objective-c
  dataSourceMaker.hd_sectionCount(10)
```

##### hd_section
用于为UITableView配置每一个section。用法如下：

``` objective-c
    [_mainTable hd_makeDataSource:^(HDTableViewDataSourceMaker *dataSourceMaker) {
        
        dataSourceMaker
        .hd_section(^(HDTableSectionMaker * sectionMaker){
            //...
        });
    }];
    
```

##### height
为整个UITableView的Cell设置默认高度。用法如下：

``` objective-c
dataSourceMaker.height(100);
```

该属性与HDTableViewSectionMaker和HDTableViewCellMaker设置的height和autoHeight冲突。优先级是autoHeight(cell) >height(cell) > height(section) > height(UITableView)

也就是说，当一个cell设置了autoHeight，则以autoHeight为准，其他cell未设置autoHeight，而设置了height（cell），则以height（cell）为准，如果两者都没有，则以height（section）为准。类推。height默认为40。

##### headerView
设置UITableView的tableHeaderView，注意与section的headerView的区别，一个UITableView只有一个tableHeaderView。用法如下：

``` objective-c
make.headerView(^(){
    UIView * headerView = [[UIView alloc]init];
    // ...
    return headerView;
});
```

##### footerView
设置UITableView的tableFooterView，同上。

##### commitEditing
设置UITableView的commitEditing代理方法，设置了该方法，则cell侧滑可以出现删除按钮。
可以在刚方法设置当cell处于编辑状态需要处理的事件。用法如下：

``` objective-c
 [make commitEditing:^(UITableView * tableView, UITableViewCellEditingStyle * editingStyle, NSIndexPath * indexPath) {
    // do somethings.                
}];
```

##### scrollViewDidScroll
设置UITableView的scrollViewDidScroll代理方法，当UITableView滚动时会调用该方法。
可以使用该方法处理UITableView的滚动事件。

````objective-c
[make scrollViewDidScroll:^(UIScrollView * scrollView) {
    // do somethings                
}];
````

## HDTableSectionMaker对象支持设置以下属性：

**注意，这些设置都是针对单独的section设置的**

##### data 

设置这个section中所要展示的数据。参数是一个NSArray。
如下：

``` objective-c
sectionMaker.data(@[@(goods1),@(goods2),...]);
```

##### headerTitle;

设置section的headerTitle。用法如：

``` objective-c
section.headerTitle("title");
```

##### footerTitle;

设置section的footerTitle。用法同上。

##### headerView;

设置section的Header View。用法如下：

``` objective-c
section.headerView(^(){
    UIView * headerView = [UIView alloc]initWithFrame:CGRectMake(0,0,320,40);
    // ...
    return headerView;
})
```
该属性与headerTitle冲突，当设置了headerView，以headerView为准。

##### footerView;

设置section的Footer View。用法同上
该属性与footerTitle冲突，当设置了footerView，以footerView为准。


## HDTableSectionMaker对象支持设置以下属性：

**注意，这些设置都是针对单独的cell设置的**

##### cell

设置`UITableView`展示数据用的Cell Class。该Class会自动注册identifier，无需手动注册

如：

``` objective-c
make.cell([CustomCell class]);
```

##### adapter

用于适配`Cell`和`Data`，如:

``` objection-c
cell.adapter(^(CustomCell * cell,id data,NSIndexPath *indexPath) {
    [cell configure:data];
    // ...
});
```

##### event

设置点击cell的响应事件。如：

``` objective-c
make.event(^(NSIndexPath *indexPath,id data) {
    CustomViewController * controller = [CustomViewController new];
    controller.viewModel.data = data;
    [self.navigationController pushViewController:controller animated:YES];
});
```

##### height

用于设置cell的高度。传一个固定的值。该高度只对该cell有效。如：

``` objective-c
make.height(100);
```

##### autoHeight

设置自动动态计算cell高度。用于cell高度不一的场景。

``` objective-c
make.autoHeight();
```
该属性与height冲突，优先级是autoHeight > height。
也就是说当设置了autoHeight，则height失效，高度以autoHeight为准





## 鸣谢

感谢您的使用和支持。欢迎issue和pull request，我会在第一时间内处理。

在这个框架中，我参考了许多大神们设计的框架。比如API的设计就参考了著名的AutoLayout框架Masonry。而在动态计算cell的高度上，则使用了@forkingdog的UITableView-FDTemplateLayoutCell法。

感谢他们带给我的灵感。

如有任何问题需要第一时间得到回答，请加QQ：9395220。

