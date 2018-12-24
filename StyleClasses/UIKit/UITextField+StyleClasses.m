//
//  UITextField+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/24/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UITextField+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

#import "NSString+Constants.h"

@implementation UITextField (StyleClasses)

- (void)didMoveToWindow {
  [super didMoveToWindow];
}

- (void)updatePlaceholderAttribute:(NSAttributedStringKey)key
                         withValue:(id)value {
  NSAttributedString *placeholder = self.attributedPlaceholder;
  NSMutableAttributedString *mPlaceholder = [[NSMutableAttributedString alloc]
                                             initWithAttributedString:placeholder];
  [mPlaceholder setAttributes:@{key: value} range:NSMakeRange(0, placeholder.length)];
  self.attributedPlaceholder = mPlaceholder;
}

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle:style];
  
  [style localizedStringForKey:@"text" inBlock:^(NSString * _Nonnull value) {
    self.text = value;
  }];
  
  [style localizedStringForKey:@"placeholder" inBlock:^(NSString * _Nonnull value) {
    self.placeholder = value;
  }];
  
  [style fontForKey:@"font" inBlock:^(UIFont * _Nonnull value) {
    self.font = value;
  }];
  
  [style colorForKey:@"text-color" inBlock:^(UIColor * _Nonnull value) {
    self.textColor = value;
  }];
  
  [style colorForKey:@"placeholder-color" inBlock:^(UIColor * _Nonnull value) {
    [self updatePlaceholderAttribute:NSForegroundColorAttributeName withValue:value];
  }];
  
  [style stringForKey:@"alignment" inBlock:^(NSString * _Nonnull value) {
    self.textAlignment = value.textAlignment;
  }];
  
  [style stringForKey:@"border-style" inBlock:^(NSString * _Nonnull value) {
    self.borderStyle = value.borderStyle;
  }];
  
  [style imageForKey:@"background-image" inBlock:^(UIImage * _Nonnull value) {
    self.background = value;
  }];
  
  [style imageForKey:@"disabled-background-image" inBlock:^(UIImage * _Nonnull value) {
    self.disabledBackground = value;
  }];
  
  [style stringForKey:@"capitalization-type" inBlock:^(NSString * _Nonnull value) {
    self.autocapitalizationType = value.capitalizationType;
  }];
  
  [style stringForKey:@"correction-type" inBlock:^(NSString * _Nonnull value) {
    self.autocorrectionType = value.correctionType;
  }];
  
  [style stringForKey:@"spell-checking-type" inBlock:^(NSString * _Nonnull value) {
    self.spellCheckingType = value.spellCheckingType;
  }];
  
  [style stringForKey:@"keyboard-type" inBlock:^(NSString * _Nonnull value) {
    self.keyboardType = value.keyboardType;
  }];
  
  [style stringForKey:@"keyboard-appearance" inBlock:^(NSString * _Nonnull value) {
    self.keyboardAppearance = value.keyboardAppearance;
  }];
  
  [style stringForKey:@"return-key" inBlock:^(NSString * _Nonnull value) {
    self.returnKeyType = value.returnKeyType;
  }];
}

@end
