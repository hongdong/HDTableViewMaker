//
//  NSObject+HDAssociated.h
//  HDTableViewMakerDemo
//
//  Created by Abner on 16/8/4.
//  Copyright © 2016年 Abner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HDAssociated)
- (nullable id)hd_getAssociatedObjectWithKey:(const void *)cKey;

- (void)hd_setAssociatedAssignObject:(nullable id)cValue key:(const void *)cKey;

- (void)hd_setAssociatedRetainObject:(nullable id)cValue key:(const void *)cKey;

- (void)hd_setAssociatedCopyObject:(nullable id)cValue key:(const void *)cKey;

- (void)hd_setAssociatedObject:(nullable id)cValue key:(const void *)cKey policy:(objc_AssociationPolicy)cPolicy;
@end
NS_ASSUME_NONNULL_END
