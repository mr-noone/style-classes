//
//  UIScrollView+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/24/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UIScrollView+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

#import "NSString+Constants.h"

@implementation UIScrollView (StyleClasses)

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle:style];
  
  [style boolForKey:@"show-horizontal-indicator" inBlock:^(BOOL value) {
    self.showsHorizontalScrollIndicator = value;
  }];
  
  [style boolForKey:@"show-vertical-indicator" inBlock:^(BOOL value) {
    self.showsVerticalScrollIndicator = value;
  }];
  
  [style boolForKey:@"scroll-enabled" inBlock:^(BOOL value) {
    self.scrollEnabled = value;
  }];
  
  [style boolForKey:@"paging-enabled" inBlock:^(BOOL value) {
    self.pagingEnabled = value;
  }];
  
  [style boolForKey:@"bounces" inBlock:^(BOOL value) {
    self.bounces = value;
  }];
  
  [style boolForKey:@"bounces-zoom" inBlock:^(BOOL value) {
    self.bouncesZoom = value;
  }];
  
  [style boolForKey:@"bounce-horizontal" inBlock:^(BOOL value) {
    self.alwaysBounceHorizontal = value;
  }];
  
  [style boolForKey:@"bounce-vertical" inBlock:^(BOOL value) {
    self.alwaysBounceVertical = value;
  }];
  
  [style boolForKey:@"delays-touches" inBlock:^(BOOL value) {
    self.delaysContentTouches = value;
  }];
  
  [style stringForKey:@"dismiss-mode" inBlock:^(NSString *value) {
    self.keyboardDismissMode = value.dismissMode;
  }];
}

@end
