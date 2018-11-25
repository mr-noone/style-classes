//
//  UITableView+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/25/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UITableView+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

#import "NSString+Constants.h"

@implementation UITableView (StyleClasses)

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle:style];
  
  [style integerForKey:@"row-height" inBlock:^(NSInteger value) {
    self.rowHeight = value;
  }];
  
  [style stringForKey:@"separator-style" inBlock:^(NSString * _Nonnull value) {
    self.separatorStyle = value.separatorStyle;
  }];
  
  [style colorForKey:@"separator-color" inBlock:^(UIColor * _Nonnull value) {
    self.separatorColor = value;
  }];
  
  [style edgeInsetsForKey:@"separator-inset" inBlock:^(UIEdgeInsets value) {
    self.separatorInset = value;
  }];
}

@end
