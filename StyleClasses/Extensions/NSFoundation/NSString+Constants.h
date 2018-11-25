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
@property (nonatomic, readonly) NSTextAlignment alignment;

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

@end
