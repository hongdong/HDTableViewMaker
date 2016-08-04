//
//  HDCommonHeader.h
//  MMTB
//
//  Created by 洪东 on 4/29/16.
//  Copyright © 2016 abnerh. All rights reserved.
//

#ifndef HDCommonHeader_h
#define HDCommonHeader_h

//单例宏
#define HDSingletonH(className)   +(instancetype)shared##className;

#define HDSingletonM(className) \
static id instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [super allocWithZone:zone]; \
}); \
return instance; \
} \
+ (instancetype)shared##className { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [[self alloc] init]; \
}); \
return instance; \
} \
- (id)copyWithZone:(NSZone *)zone { \
return instance; \
}


///------
/// Block
///------

typedef void (^VoidBlock)();
typedef BOOL (^BoolBlock)();
typedef int  (^IntBlock) ();
typedef id   (^IDBlock)  ();

typedef void (^VoidBlock_int)(NSInteger index);
typedef BOOL (^BoolBlock_int)(NSInteger index);
typedef int  (^IntBlock_int) (NSInteger index);
typedef id   (^IDBlock_int)  (NSInteger index);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);

//版本号
#define HDAPPVersion [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

#define HDAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//类型强转
#define hTypeof(__TYPE, __PROPERTY) ({typeof(__TYPE *) __CLASS = (__TYPE *)__PROPERTY; __CLASS;})

//Weak
#define HDWeak(var, weakVar) __weak __typeof(&*var) weakVar = var
#define HDStrong_DoNotCheckNil(weakVar, _var) __typeof(&*weakVar) _var = weakVar
#define HDStrong(weakVar, _var) HDStrong_DoNotCheckNil(weakVar, _var); if (!_var) return;

#define HDWeak_(var) HDWeak(var, weak_##var);
#define HDStrong_(var) HDStrong(weak_##var, _##var);

/** defines a weak `self` named `__weakSelf` */
#define HDWeakSelf      HDWeak(self, __weakSelf);
#define HDRWeakSelf @weakify(self)
/** defines a strong `self` named `_self` from `__weakSelf` */
#define HDStrongSelf    HDStrong(__weakSelf, _self);
#define HDRStrongSelf @strongify(self)

#define HDArrIsEmptyOrNil(_arr_) (!_arr_||[_arr_ hd_arrIsEmpty])
#define HDStrIsEmptyOrNil(_str_) (!_str_|| ([_str_ isEqual:[NSNull null]]) ||[_str_ isEmpty])

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#define HDString(s, ...) ([NSString stringWithFormat:(s), ##__VA_ARGS__])

#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define HDLogError(error) NSLog(@"Error: %@", error)


#define HDKeyWindow [UIApplication sharedApplication].keyWindow

#define HDDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define HDDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define HDDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#define HDSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define HDSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define HDSCREEN_SCALE [UIScreen mainScreen].scale
#define HDSCREEN_BOUNDS [UIScreen mainScreen].bounds

#define TEMP_WIDTH 375.0
#define RATIO HDSCREEN_WIDTH/TEMP_WIDTH
#define GET(v) GETPXVALUE(v*RATIO)
#define GET_FONT(v) GETPXVALUE(v*RATIO)
#define GETPXVALUE(v) ceil((v)*HDSCREEN_SCALE)/HDSCREEN_SCALE

#define CGWidth(rect)                   rect.size.width

#define CGHeight(rect)                  rect.size.height

#define CGOriginX(rect)                 rect.origin.x

#define CGOriginY(rect)                 rect.origin.y

#define HDColor(r,g,b,a) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a]

//系统默认字体
#define HDFontSystemR(_size_) [UIFont systemFontOfSize:_size_]
#define HDFontSystemB(_size_) [UIFont boldSystemFontOfSize:_size_]

#define HDBarTitle(TITLE)    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 24)];\
titleLabel.backgroundColor = [UIColor clearColor];\
titleLabel.textColor = HDColorBarTitle;\
titleLabel.text = TITLE;\
titleLabel.font = HDFontBarTitle;\
titleLabel.textAlignment = NSTextAlignmentCenter;\
self.navigationItem.titleView = titleLabel;

#endif /* HDCommonHeader_h */
