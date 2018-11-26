//
//  UINavigationItem+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/25/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UINavigationItem+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"
#import "NSObject+Runtime.h"
#import "NSString+Constants.h"

#import <objc/runtime.h>

static const void *kStyleClass = &kStyleClass;

@implementation UINavigationItem (StyleClasses)

#pragma mark - Getters

- (NSString *)styleClass {
  return objc_getAssociatedObject(self, kStyleClass) ?: @"NavigationItem";
}

#pragma mark - Setters

- (void)setStyleClass:(NSString *)styleClass {
  NSString *class;
  if (styleClass != nil) {
    class = [@"NavigationItem." stringByAppendingString:styleClass];
  } else {
    class = styleClass;
  }
  
  objc_setAssociatedObject(self, kStyleClass, class, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Style updates

- (void)setNeedsUpdateStyle {
  NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
  [center postNotificationName:SCNeedsUpdateStyleNotification object:self];
}

- (void)updateWithStyle:(nonnull SCStyle *)style {
  [style localizedStringForKey:@"title" inBlock:^(NSString * _Nonnull value) {
    self.title = value;
  }];
  
  [style localizedStringForKey:@"prompt" inBlock:^(NSString * _Nonnull value) {
    self.prompt = value;
  }];
  
  [style localizedStringForKey:@"back-title" inBlock:^(NSString * _Nonnull value) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [self performSelector:@selector(setBackButtonTitle:) withObject:value];
#pragma clang diagnostic pop
  }];
  
  if (@available(iOS 11.0, *)) {
    [style stringForKey:@"large-title-mode" inBlock:^(NSString * _Nonnull value) {
      self.largeTitleDisplayMode = value.largeTitleDisplayMode;
    }];
  }
}

@end
