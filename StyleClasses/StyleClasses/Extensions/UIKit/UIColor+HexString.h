//
//  UIColor+HexString.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

/**
 Creates and returns a color using string with HEX.
 "#" is not required.
 
 @param hexString HEX string with format: #RGB, #ARGB, #RRGGBB, #AARRGGBB.
 @return UIColor or nil
 */
+ (nullable UIColor *)colorWithHexString:(nonnull NSString *)hexString;

/**
 Create and return string with HEX value from color with format #AARRGGBB
 */
@property (nonatomic, readonly, nonnull) NSString *hexStringARGB;

/**
 Create and return string with HEX value from color with format #RRGGBB
 */
@property (nonatomic, readonly, nonnull) NSString *hexStringRGB;

@end
