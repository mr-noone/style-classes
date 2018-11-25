//
//  UILabel+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/24/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UILabel+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

#import "NSString+Constants.h"

@implementation UILabel (StyleClasses)

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle: style];
  
  [style localizedStringForKey:@"text" inBlock:^(NSString *value) {
    self.text = value;
  }];
  
  [style colorForKey:@"text-color" inBlock:^(UIColor *value) {
    self.textColor = value;
  }];
  
  [style fontForKey:@"font" inBlock:^(UIFont *value) {
    self.font = value;
  }];
  
  [style stringForKey:@"alignment" inBlock:^(NSString *value) {
    self.textAlignment = value.alignment;
  }];
  
  [style integerForKey:@"lines" inBlock:^(NSInteger value) {
    self.numberOfLines = value;
  }];
}

@end
