//
//  NSObject+HDAssociated.m
//  HDTableViewMakerDemo
//
//  Created by Abner on 16/8/4.
//  Copyright © 2016年 Abner. All rights reserved.
//

#import "NSObject+HDAssociated.h"

@implementation NSObject (HDAssociated)
- (id)hd_getAssociatedObjectWithKey:(const void *)cKey
{
    return objc_getAssociatedObject(self, cKey);
}

- (void)hd_setAssociatedAssignObject:(id)cValue key:(const void *)cKey
{
    objc_setAssociatedObject(self, cKey, cValue, OBJC_ASSOCIATION_ASSIGN);
}

- (void)hd_setAssociatedRetainObject:(id)cValue key:(const void *)cKey
{
    objc_setAssociatedObject(self, cKey, cValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hd_setAssociatedCopyObject:(id)cValue key:(const void *)cKey
{
    objc_setAssociatedObject(self, cKey, cValue, OBJC_ASSOCIATION_COPY);
}

- (void)hd_setAssociatedObject:(id)cValue key:(const void *)cKey policy:(objc_AssociationPolicy)cPolicy
{
    objc_setAssociatedObject(self, cKey, cValue, cPolicy);
}

@end
