//
//  UIButton+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/24/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UIButton+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

#import "UIImage+Color.h"

@implementation UIButton (StyleClasses)

- (void)updateInsetsWithStyle:(SCStyle *)style {
  [style edgeInsetsForKey:@"title-insets" inBlock:^(UIEdgeInsets value) {
    self.titleEdgeInsets = value;
  }];
  
  [style edgeInsetsForKey:@"image-insets" inBlock:^(UIEdgeInsets value) {
    self.imageEdgeInsets = value;
  }];
  
  [style edgeInsetsForKey:@"content-insets" inBlock:^(UIEdgeInsets value) {
    self.contentEdgeInsets = value;
  }];
}

- (void)updateTitleWithStyle:(SCStyle *)style {
  [style localizedStringForKey:@"normal-title" inBlock:^(NSString *value) {
    [self setTitle:value forState:UIControlStateNormal];
  }];
  
  [style localizedStringForKey:@"highlighted-title" inBlock:^(NSString *value) {
    [self setTitle:value forState:UIControlStateHighlighted];
  }];
  
  [style localizedStringForKey:@"disabled-title" inBlock:^(NSString *value) {
    [self setTitle:value forState:UIControlStateDisabled];
  }];
  
  [style localizedStringForKey:@"selected-title" inBlock:^(NSString *value) {
    [self setTitle:value forState:UIControlStateSelected];
  }];
}

- (void)updateTitleColorWithStyle:(SCStyle *)style {
  [style colorForKey:@"normal-title-color" inBlock:^(UIColor *value) {
    [self setTitleColor:value forState:UIControlStateNormal];
  }];
  
  [style colorForKey:@"highlighted-title-color" inBlock:^(UIColor *value) {
    [self setTitleColor:value forState:UIControlStateHighlighted];
  }];
  
  [style colorForKey:@"disabled-title-color" inBlock:^(UIColor *value) {
    [self setTitleColor:value forState:UIControlStateDisabled];
  }];
  
  [style colorForKey:@"selected-title-color" inBlock:^(UIColor *value) {
    [self setTitleColor:value forState:UIControlStateSelected];
  }];
}

- (void)updateImageWithStyle:(SCStyle *)style {
  [style imageForKey:@"normal-image" inBlock:^(UIImage *value) {
    [self setImage:value forState:UIControlStateNormal];
  }];
  
  [style imageForKey:@"highlighted-image" inBlock:^(UIImage *value) {
    [self setImage:value forState:UIControlStateHighlighted];
  }];
  
  [style imageForKey:@"disabled-image" inBlock:^(UIImage *value) {
    [self setImage:value forState:UIControlStateDisabled];
  }];
  
  [style imageForKey:@"selected-image" inBlock:^(UIImage *value) {
    [self setImage:value forState:UIControlStateSelected];
  }];
}

- (void)updateBackgroundColorWithStyle:(SCStyle *)style {
  [style colorForKey:@"normal-background-color" inBlock:^(UIColor *value) {
    [self setBackgroundImage:[UIImage imageWithColor:value] forState:UIControlStateNormal];
  }];
  
  [style colorForKey:@"highlighted-background-color" inBlock:^(UIColor *value) {
    [self setBackgroundImage:[UIImage imageWithColor:value] forState:UIControlStateHighlighted];
  }];
  
  [style colorForKey:@"disabled-background-color" inBlock:^(UIColor *value) {
    [self setBackgroundImage:[UIImage imageWithColor:value] forState:UIControlStateDisabled];
  }];
  
  [style colorForKey:@"selected-background-color" inBlock:^(UIColor *value) {
    [self setBackgroundImage:[UIImage imageWithColor:value] forState:UIControlStateSelected];
  }];
}

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle:style];
  
  [self updateInsetsWithStyle:style];
  [self updateTitleWithStyle:style];
  [self updateTitleColorWithStyle:style];
  [self updateImageWithStyle:style];
  [self updateBackgroundColorWithStyle:style];
  
  [style fontForKey:@"font" inBlock:^(UIFont *value) {
    self.titleLabel.font = value;
  }];
}

@end
