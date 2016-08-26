//
//  HDTMCommonHeader.h
//  HDTableViewMakerDemo
//
//  Created by Abner on 16/8/13.
//  Copyright © 2016年 Abner. All rights reserved.
//

#ifndef HDTMCommonHeader_h
#define HDTMCommonHeader_h

typedef void(^HDTMVoidBlock)();

//Weak
#define HDWeak(var, weakVar) __weak __typeof(&*var) weakVar = var
#define HDStrong_DoNotCheckNil(weakVar, _var) __typeof(&*weakVar) _var = weakVar
#define HDStrong(weakVar, _var) HDStrong_DoNotCheckNil(weakVar, _var); if (!_var) return;

#define HDWeak_(var) HDWeak(var, weak_##var);
#define HDStrong_(var) HDStrong(weak_##var, _##var);

/** defines a weak `self` named `__weakSelf` */
#define HDWeakSelf      HDWeak(self, __weakSelf);
/** defines a strong `self` named `_self` from `__weakSelf` */
#define HDStrongSelf    HDStrong(__weakSelf, _self);


#endif /* HDTMCommonHeader_h */
