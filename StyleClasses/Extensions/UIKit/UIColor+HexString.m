//
//  UIColor+HexString.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "UIColor+HexString.h"
#import "NSCharacterSet+HEX.h"

@implementation UIColor (HexString)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    NSCharacterSet *characterSet = [[NSCharacterSet hexadecimalCharacterSet] invertedSet];
    if ([hexString rangeOfCharacterFromSet:characterSet].location != NSNotFound) {
        return nil;
    }
    
    uint32_t code = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&code];
    
    CGFloat r = 0, g = 0, b = 0, a = 0;
    
    switch(hexString.length) {
        case 3:
            r = (CGFloat)((code >> 8) * 17) / 255;
            g = (CGFloat)((code >> 4 & 0xf) * 17) / 255;
            b = (CGFloat)((code & 0xf) * 17) / 255;
            a = 1;
            break;
        case 4:
            r = (CGFloat)((code >> 8 & 0xf) * 17) / 255;
            g = (CGFloat)((code >> 4 & 0xf) * 17) / 255;
            b = (CGFloat)((code & 0xf) * 17) / 255;
            a = (CGFloat)((code >> 12) * 17) / 255;
            break;
        case 6:
            r = (CGFloat)(code >> 16) / 255;
            g = (CGFloat)(code >> 8 & 0xff) / 255;
            b = (CGFloat)(code & 0xff) / 255;
            a = 1;
            break;
        case 8:
            r = (CGFloat)(code >> 16 & 0xff) / 255;
            g = (CGFloat)(code >> 8 & 0xff) / 255;
            b = (CGFloat)(code & 0xff) / 255;
            a = (CGFloat)(code >> 24) / 255;
            break;
        default:
            return nil;
    }
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

- (NSString *)hexStringARGB {
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    uint32_t argb = 0;
    argb |= (int)(a * 255) << 24;
    argb |= (int)(r * 255) << 16;
    argb |= (int)(g * 255) << 8;
    argb |= (int)(b * 255) << 0;
    
    return [[NSString stringWithFormat:@"#%08x", argb] uppercaseString];
}

- (NSString *)hexStringRGB {
    CGFloat r, g, b;
    [self getRed:&r green:&g blue:&b alpha:nil];
    
    uint32_t rgb = 0;
    rgb |= (int)(r * 255) << 16;
    rgb |= (int)(g * 255) << 8;
    rgb |= (int)(b * 255) << 0;
    
    return [[NSString stringWithFormat:@"#%06x", rgb] uppercaseString];
}

@end
