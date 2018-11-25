//
//  NSString+Constants.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/24/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "NSString+Constants.h"

@implementation NSString (Constants)

- (NSTextAlignment)alignment {
  if ([self isEqualToString:@"left"])
    return NSTextAlignmentLeft;
  else if ([self isEqualToString:@"right"])
    return NSTextAlignmentRight;
  else if ([self isEqualToString:@"center"])
    return NSTextAlignmentCenter;
  else if ([self isEqualToString:@"justified"])
    return NSTextAlignmentJustified;
  else if ([self isEqualToString:@"natural"])
    return NSTextAlignmentNatural;
  else
    return NSTextAlignmentLeft;
}

- (UIScrollViewKeyboardDismissMode)dismissMode {
  if ([self isEqualToString:@"on-drag"])
    return UIScrollViewKeyboardDismissModeOnDrag;
  else if ([self isEqualToString:@"interactive"])
    return UIScrollViewKeyboardDismissModeInteractive;
  else
    return UIScrollViewKeyboardDismissModeNone;
}

- (UITextBorderStyle)borderStyle {
  if ([self isEqualToString:@"rounded-rect"])
    return UITextBorderStyleRoundedRect;
  else if ([self isEqualToString:@"line"])
    return UITextBorderStyleLine;
  else if ([self isEqualToString:@"bezel"])
    return UITextBorderStyleBezel;
  else
    return UITextBorderStyleNone;
}

- (UITextAutocapitalizationType)capitalizationType {
  if ([self isEqualToString:@"words"])
    return UITextAutocapitalizationTypeWords;
  else if ([self isEqualToString:@"sentences"])
    return UITextAutocapitalizationTypeSentences;
  else if ([self isEqualToString:@"all-characters"])
    return UITextAutocapitalizationTypeAllCharacters;
  else
    return UITextAutocapitalizationTypeNone;
}

- (UITextAutocorrectionType)correctionType {
  if ([self isEqualToString:@"no"])
    return UITextAutocorrectionTypeNo;
  else if ([self isEqualToString:@"yes"])
    return UITextAutocorrectionTypeYes;
  else
    return UITextAutocorrectionTypeDefault;
}

- (UITextSpellCheckingType)spellCheckingType {
  if ([self isEqualToString:@"no"])
    return UITextSpellCheckingTypeNo;
  else if ([self isEqualToString:@"yes"])
    return UITextSpellCheckingTypeYes;
  else
    return UITextSpellCheckingTypeDefault;
}

- (UIKeyboardType)keyboardType {
  if ([self isEqualToString:@"ascii"])
    return UIKeyboardTypeASCIICapable;
  else if ([self isEqualToString:@"numbers-and-punctuation"])
    return UIKeyboardTypeNumbersAndPunctuation;
  else if ([self isEqualToString:@"url"])
    return UIKeyboardTypeURL;
  else if ([self isEqualToString:@"number"])
    return UIKeyboardTypeNumberPad;
  else if ([self isEqualToString:@"phone"])
    return UIKeyboardTypePhonePad;
  else if ([self isEqualToString:@"name-phone"])
    return UIKeyboardTypeNamePhonePad;
  else if ([self isEqualToString:@"email"])
    return UIKeyboardTypeEmailAddress;
  else if ([self isEqualToString:@"decimal"])
    return UIKeyboardTypeDecimalPad;
  else if ([self isEqualToString:@"twitter"])
    return UIKeyboardTypeTwitter;
  else if ([self isEqualToString:@"web-search"])
    return UIKeyboardTypeWebSearch;
  else if ([self isEqualToString:@"ascii-number"])
    if (@available(iOS 10.0, *))
      return UIKeyboardTypeASCIICapableNumberPad;
    else
      return UIKeyboardTypeDefault;
  else
    return UIKeyboardTypeDefault;
}

- (UIKeyboardAppearance)keyboardAppearance {
  if ([self isEqualToString:@"dark"])
    return UIKeyboardAppearanceDark;
  else if ([self isEqualToString:@"light"])
    return UIKeyboardAppearanceLight;
  else
    return UIKeyboardAppearanceDefault;
}

- (UIReturnKeyType)returnKeyType {
  if ([self isEqualToString:@"go"])
    return UIReturnKeyGo;
  else if ([self isEqualToString:@"google"])
    return UIReturnKeyGoogle;
  else if ([self isEqualToString:@"join"])
    return UIReturnKeyJoin;
  else if ([self isEqualToString:@"next"])
    return UIReturnKeyNext;
  else if ([self isEqualToString:@"route"])
    return UIReturnKeyRoute;
  else if ([self isEqualToString:@"search"])
    return UIReturnKeySearch;
  else if ([self isEqualToString:@"send"])
    return UIReturnKeySend;
  else if ([self isEqualToString:@"yahoo"])
    return UIReturnKeyYahoo;
  else if ([self isEqualToString:@"done"])
    return UIReturnKeyDone;
  else if ([self isEqualToString:@"emergency-call"])
    return UIReturnKeyEmergencyCall;
  else if ([self isEqualToString:@"continue"])
    if (@available(iOS 9.0, *))
      return UIReturnKeyContinue;
    else
      return UIReturnKeyDefault;
  else
    return UIReturnKeyDefault;
}

- (UIBarStyle)barStyle {
  if ([self isEqualToString:@"black"])
    return UIBarStyleBlack;
  else if ([self isEqualToString:@"black-opaque"])
    return UIBarStyleBlackOpaque;
  else if ([self isEqualToString:@"black-translucent"])
    return UIBarStyleBlackTranslucent;
  else
    return UIBarStyleDefault;
}

@end
