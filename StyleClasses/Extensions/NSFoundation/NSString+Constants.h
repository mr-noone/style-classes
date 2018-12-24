//
//  NSString+Constants.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/24/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Constants)

/**
 The NSTextAlignment value of the string.
 Can be 'left', 'right', 'center', 'justified' or 'natural'.
 This property is NSTextAlignmentLeft if the string does not match the available value.
 */
@property (nonatomic, readonly) NSTextAlignment textAlignment;

/**
 The UIScrollViewKeyboardDismissMode value of the string. Can be 'none', 'on-drag' or 'interactive'.
 This property is UIScrollViewKeyboardDismissModeNone if the string does not match the available value.
 */
@property (nonatomic, readonly) UIScrollViewKeyboardDismissMode dismissMode;

/**
 The UITextBorderStyle value of the string. Can be 'none', 'line', 'bezel' or 'rounded-rect'.
 This property is UITextBorderStyleNone if the string does not match the available value.
 */
@property (nonatomic, readonly) UITextBorderStyle borderStyle;

/**
 The UITextAutocapitalizationType value of the string. Can be 'none', 'words', 'sentences' or 'all-characters'.
 This property is UITextAutocapitalizationTypeNone if the string does not match the available value.
 */
@property (nonatomic, readonly) UITextAutocapitalizationType capitalizationType;

/**
 The UITextAutocorrectionType value of the string. Can be 'default', 'no' or 'yes'.
 This property is UITextAutocorrectionTypeDefault if the string does not match the available value.
 */
@property (nonatomic, readonly) UITextAutocorrectionType correctionType;

/**
 The UITextSpellCheckingType value of the string. Can be 'default', 'no' or 'yes'.
 This property is UITextSpellCheckingTypeDefault if the string does not match the available value.
 */
@property (nonatomic, readonly) UITextSpellCheckingType spellCheckingType;

/**
 The UIKeyboardType value of the string. Can be 'default', 'ascii', 'numbers-and-punctuation', 'url',
 'number', 'phone', 'name-phone', 'email', 'decimal', 'twitter', 'web-search' or 'ascii-number'.
 This property is UITextSpellCheckingTypeDefault if the string does not match the available value.
 */
@property (nonatomic, readonly) UIKeyboardType keyboardType;

/**
 The UIKeyboardAppearance value of the string. Can be 'default', 'dark' or 'light'.
 This property is UIKeyboardAppearanceDefault if the string does not match the available value.
 */
@property (nonatomic, readonly) UIKeyboardAppearance keyboardAppearance;

/**
 The UIReturnKeyType value of the string. Can be 'default', 'go', 'google', 'join',
 'next', 'route', 'search', 'send', 'yahoo', 'done', 'emergency-call' or 'continue'.
 This property is UIReturnKeyDefault if the string does not match the available value.
 */
@property (nonatomic, readonly) UIReturnKeyType returnKeyType;

/**
 The UIBarStyle value of the string. Can be 'default', 'black', 'black-opaque' or 'black-translucent'.
 This property is UIBarStyleDefault if the string does not match the available value.
 */
@property (nonatomic, readonly) UIBarStyle barStyle;

/**
 The UITableViewCellSeparatorStyle value of the string. Can be 'single-line' or 'none'.
 This property is UITableViewCellSeparatorStyleNone if the string does not match the available value.
 */
@property (nonatomic, readonly) UITableViewCellSeparatorStyle separatorStyle;

/**
 The UINavigationItemLargeTitleDisplayMode value of the string. Can be 'always', 'never' or 'automatic'.
 This property is UINavigationItemLargeTitleDisplayModeAutomatic if the string does not match the available value.
 */
@property (nonatomic, readonly) UINavigationItemLargeTitleDisplayMode largeTitleDisplayMode;

/**
 The UIStackViewAlignment value of the string. Can be 'leading', 'top',
 'first-baseline', 'center', 'trailing', 'bottom', 'last-baseline' or 'fill'.
 This property is UIStackViewAlignmentFill if the string does not match the available value.
 */
@property (nonatomic, readonly) UIStackViewAlignment stackViewAlignment API_AVAILABLE(ios(9.0));

/**
 The UILayoutConstraintAxis value of the string. Can be 'horizontal' or 'vertical'.
 This property is UILayoutConstraintAxisVertical if the string does not match the available value.
 */
@property (nonatomic, readonly) UILayoutConstraintAxis constraintAxis;

/**
 The UIStackViewDistribution value of the string. Can be 'fill', 'fill-equally', 'fill-proportionally' or 'equal-spacing'.
 This property is UIStackViewDistributionFill if the string does not match the available value.
 */
@property (nonatomic, readonly) UIStackViewDistribution stackViewDistribution API_AVAILABLE(ios(9.0));

@end
