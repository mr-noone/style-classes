//
//  SCStyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "SCStyleClasses.h"
#import "SCStylesheet.h"
#import "SCStyleClass.h"
#import "SCStyle+Private.h"

#import <UIKit/UIKit.h>

@interface SCStyleClasses ()

@property (strong, nonatomic) NSBundle *bundle;
@property (strong, nonatomic) SCStylesheet *stylesheet;

@end

@implementation SCStyleClasses

#pragma mark - Init

- (instancetype)_init {
    self = [super init];
    
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center addObserver:self selector:@selector(needsUpdateStyle:) name:SCNeedsUpdateStyleNotification object:nil];
    [center addObserver:self selector:@selector(didMoveToWindow:) name:SCDidMoveToWindowNotification object:nil];
    
    return self;
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

+ (SCStyleClasses *)instance {
    static dispatch_once_t onceToken;
    static SCStyleClasses *instance;
    dispatch_once(&onceToken, ^{
        instance = [[super alloc] _init];
    });
    return instance;
}

#pragma mark - Configure

- (void)configureWithStylesheetName:(NSString *)stylesheetName withBundle:(NSBundle *)bundle {
    if (stylesheetName.length == 0) {
        [NSException raise:NSInvalidArgumentException format:@"The stylesheet name cannot be empty"];
    }
    
    if (bundle == nil) {
        [NSException raise:NSInvalidArgumentException format:@"The bundle cannot be nil"];
    }
    
    self.bundle = bundle;
    NSString *stylesheetPath = [bundle pathForResource:stylesheetName ofType:@"plist"];
    
    if (stylesheetPath.length == 0) {
        [NSException raise:NSFileNotFoundException format:@"File with name '%@' not found", stylesheetName];
    }
    
    self.stylesheet = [[SCStylesheet alloc] initWithStylesheetPath:stylesheetPath
                                                        withBundle:self.bundle];
}

#pragma mark - Notification handlers

- (void)didMoveToWindow:(NSNotification *)notification {
    if ([(NSObject *)notification.object conformsToProtocol:@protocol(SCStyleClass)]) {
        [self updateStyleForObject:notification.object];
    }
}

- (void)needsUpdateStyle:(NSNotification *)notification {
    if ([(NSObject *)notification.object conformsToProtocol:@protocol(SCStyleClass)]) {
        [self updateStyleForObject:notification.object];
    }
    
    if ([(NSObject *)notification.object isKindOfClass:UIView.class]) {
        [self updateStyleForSubviews:(UIView *)notification.object];
    }
}

#pragma mark - Update style

- (void)updateStyleForObject:(id<SCStyleClass, NSObject>)object {
    NSString *styleClass = object.styleClass ?: @"";
    SCStyle *style = [self.stylesheet styleForStyleClass:styleClass];
    if (style != nil && style.isEmpty == NO) {
        [object updateWithStyle:style];
    }
}

- (void)updateStyleForSubviews:(UIView<SCStyleClass> *)view {
    for (UIView *subview in view.subviews) {
        if ([subview conformsToProtocol:@protocol(SCStyleClass)]) {
            [self updateStyleForObject:subview];
            [self updateStyleForSubviews:subview];
        }
    }
}

@end
