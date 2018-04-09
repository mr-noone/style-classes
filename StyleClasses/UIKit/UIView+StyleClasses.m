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
#import <Foundation/Foundation.h>

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

#pragma mark - Getters

- (NSString *)defaultStyleClass {
    NSMutableArray<NSString *> *classNames = [NSMutableArray array];
    
    Class class = self.class;
    while (class != UIResponder.class && class != nil) {
        NSString *className = [NSString stringWithCString:class_getName(class) encoding:NSUTF8StringEncoding];
        [classNames insertObject:[className stringByReplacingOccurrencesOfString:@"UI" withString:@""] atIndex:0];
        class = class.superclass;
    }
    
    return [classNames componentsJoinedByString:@"."];
}

- (NSString *)styleClass {
    return objc_getAssociatedObject(self, kStyleClass) ?: self.defaultStyleClass;
}

#pragma mark - Setters

- (void)setStyleClass:(NSString *)styleClass {
    objc_setAssociatedObject(self, kStyleClass, styleClass, OBJC_ASSOCIATION_COPY_NONATOMIC);
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
    [style colorForKey:@"background-color" inBlock:^(UIColor * _Nonnull value) {
        self.backgroundColor = value;
    }];
    
    [style colorForKey:@"tint-color" inBlock:^(UIColor * _Nonnull value) {
        self.tintColor = value;
    }];
    
    [style floatForKey:@"alpha" inBlock:^(CGFloat value) {
        self.alpha = value;
    }];
    
    [style boolForKey:@"clips-to-bounds" inBlock:^(BOOL value) {
        self.clipsToBounds = value;
    }];
    
    [style colorForKey:@"border-color" inBlock:^(UIColor * _Nonnull value) {
        self.layer.borderColor = value.CGColor;
    }];
    
    [style floatForKey:@"border-width" inBlock:^(CGFloat value) {
        self.layer.borderWidth = value;
    }];
    
    [style floatForKey:@"corner-radius" inBlock:^(CGFloat value) {
        self.layer.cornerRadius = value;
    }];
    
    [style floatForKey:@"shadow-opacity" inBlock:^(CGFloat value) {
        self.layer.shadowOpacity = value;
    }];
    
    [style floatForKey:@"shadow-radius" inBlock:^(CGFloat value) {
        self.layer.shadowRadius = value;
    }];
    
    [style sizeForKey:@"shadow-offset" inBlock:^(CGSize value) {
        self.layer.shadowOffset = value;
    }];
    
    [style colorForKey:@"shadow-color" inBlock:^(UIColor * _Nonnull value) {
        self.layer.shadowColor = value.CGColor;
    }];
}

@end
