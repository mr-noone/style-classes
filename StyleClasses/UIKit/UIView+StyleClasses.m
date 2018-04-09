//
//  UIView+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 16.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "UIView+StyleClasses.h"
#import "NSObject+Runtime.h"
#import <objc/runtime.h>

#import "SCStyle.h"

static const void *kStyleClass = &kStyleClass;

@implementation UIView (StyleClasses)

#pragma mark - Initializing a Class

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:@selector(didMoveToWindow)
                         withMethod:@selector(sc_didMoveToWindow)];
    });
}

#pragma mark - Observing View-Related Changes

- (void)sc_didMoveToWindow {
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center postNotificationName:SCDidMoveToWindowNotification object:self];
    
    [self sc_didMoveToWindow];
}

#pragma mark - Style updates

- (void)setNeedsUpdateStyle {
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center postNotificationName:SCNeedsUpdateStyleNotification object:self];
}

- (void)updateWithStyle:(SCStyle *)style {
    
}

#pragma mark - Getters

- (NSString *)styleClass {
    return objc_getAssociatedObject(self, kStyleClass);
}

#pragma mark - Setters

- (void)setStyleClass:(NSString *)styleClass {
    objc_setAssociatedObject(self, kStyleClass, styleClass, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
