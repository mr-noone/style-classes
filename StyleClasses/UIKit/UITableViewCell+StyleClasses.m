//
//  UITableViewCell+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/25/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UITableViewCell+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

#import "NSString+Constants.h"

@implementation UITableViewCell (StyleClasses)

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle:style];
  
  [style fontForKey:@"text-font" inBlock:^(UIFont * _Nonnull value) {
    self.textLabel.font = value;
  }];
  
  [style colorForKey:@"text-color" inBlock:^(UIColor * _Nonnull value) {
    self.textLabel.textColor = value;
  }];
  
  [style fontForKey:@"detail-text-font" inBlock:^(UIFont * _Nonnull value) {
    self.detailTextLabel.font = value;
  }];
  
  [style colorForKey:@"detail-text-color" inBlock:^(UIColor * _Nonnull value) {
    self.detailTextLabel.textColor = value;
  }];
}

@end
