//
//  UINavigationBar+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/25/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UINavigationBar+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

#import "UIImage+Color.h"
#import "NSString+Constants.h"
#import "NSDictionary+Additional.h"
#import "NSObject+Runtime.h"

@implementation UINavigationBar (StyleClasses)

+ (void)load {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [self swizzleInstanceMethod:@selector(titleTextAttributes)
                     withMethod:@selector(sc_titleTextAttributes)];
    [self swizzleInstanceMethod:@selector(largeTitleTextAttributes)
                     withMethod:@selector(sc_largeTitleTextAttributes)];
  });
}

- (NSDictionary<NSAttributedStringKey, id> *)sc_titleTextAttributes {
  NSDictionary *dict = [self sc_titleTextAttributes];
  if (dict == nil) dict = [NSDictionary dictionary];
  return dict;
}

- (NSDictionary<NSAttributedStringKey, id> *)sc_largeTitleTextAttributes {
  NSDictionary *dict = [self sc_largeTitleTextAttributes];
  if (dict == nil) dict = [NSDictionary dictionary];
  return dict;
}

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle:style];
  
  [style imageForKey:@"back-image" inBlock:^(UIImage * _Nonnull value) {
    self.backIndicatorImage = value;
  }];
  
  [style imageForKey:@"back-mask-image" inBlock:^(UIImage * _Nonnull value) {
    self.backIndicatorTransitionMaskImage = value;
  }];
  
  [style stringForKey:@"bar-style" inBlock:^(NSString * _Nonnull value) {
    self.barStyle = value.barStyle;
  }];
  
  [style colorForKey:@"bar-tint-color" inBlock:^(UIColor * _Nonnull value) {
    self.barTintColor = value;
  }];
  
  [style colorForKey:@"bar-shadow-color" inBlock:^(UIColor * _Nonnull value) {
    self.shadowImage = [UIImage imageWithColor:value];
  }];
  
  [style imageForKey:@"shadow-image" inBlock:^(UIImage * _Nonnull value) {
    self.shadowImage = value;
  }];
  
  [style boolForKey:@"translucent" inBlock:^(BOOL value) {
    self.translucent = value;
  }];
  
  [style imageForKey:@"background-image" inBlock:^(UIImage * _Nonnull value) {
    [self setBackgroundImage:value forBarMetrics:UIBarMetricsDefault];
  }];
  
  [style colorForKey:@"bar-background-color" inBlock:^(UIColor * _Nonnull value) {
    [self setBackgroundImage:[UIImage imageWithColor:value] forBarMetrics:UIBarMetricsDefault];
  }];
  
  [style fontForKey:@"title-font" inBlock:^(UIFont * _Nonnull value) {
    self.titleTextAttributes = [self.titleTextAttributes dictionaryByAddingObject:value forKey:NSFontAttributeName];
  }];
  
  [style colorForKey:@"title-color" inBlock:^(UIColor * _Nonnull value) {
    self.titleTextAttributes = [self.titleTextAttributes dictionaryByAddingObject:value forKey:NSForegroundColorAttributeName];
  }];
  
  if (@available(iOS 11.0, *)) {
    [style fontForKey:@"large-title-font" inBlock:^(UIFont * _Nonnull value) {
      self.largeTitleTextAttributes = [self.largeTitleTextAttributes dictionaryByAddingObject:value forKey:NSFontAttributeName];
    }];
    
    [style colorForKey:@"large-title-color" inBlock:^(UIColor * _Nonnull value) {
      self.largeTitleTextAttributes = [self.largeTitleTextAttributes dictionaryByAddingObject:value forKey:NSForegroundColorAttributeName];
    }];
    
    [style boolForKey:@"prefers-large-titles" inBlock:^(BOOL value) {
      self.prefersLargeTitles = value;
    }];
  }
}

@end
