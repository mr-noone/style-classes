//
//  NSCharacterSet+HEX.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "NSCharacterSet+HEX.h"

@implementation NSCharacterSet (HEX)

+ (NSCharacterSet *)hexadecimalCharacterSet {
    NSString *hexCharacters = @"0123456789ABCDEFabcdef";
    return [NSCharacterSet characterSetWithCharactersInString:hexCharacters];
}

@end
