//
//  UIStackView+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 12/24/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UIStackView+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

#import "NSString+Constants.h"

@implementation UIStackView (StyleClasses)

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle:style];
  
  [style stringForKey:@"alignment" inBlock:^(NSString * _Nonnull value) {
    self.alignment = value.stackViewAlignment;
  }];
  
  [style stringForKey:@"axis" inBlock:^(NSString * _Nonnull value) {
    self.axis = value.constraintAxis;
  }];
  
  [style stringForKey:@"distribution" inBlock:^(NSString * _Nonnull value) {
    self.distribution = value.stackViewDistribution;
  }];
  
  [style floatForKey:@"spacing" inBlock:^(CGFloat value) {
    self.spacing = value;
  }];
  
  [style boolForKey:@"baseline-relative-arrangement" inBlock:^(BOOL value) {
    self.baselineRelativeArrangement = value;
  }];
  
  [style boolForKey:@"layout-margins-relative-arrangement" inBlock:^(BOOL value) {
    self.layoutMarginsRelativeArrangement = value;
  }];
}

@end
