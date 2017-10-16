//
//  UIFont+String.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "UIFont+String.h"

@implementation UIFont (String)

+ (instancetype)fontFromString:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *components = [string componentsSeparatedByString:@","];
    
    if (components.count != 2) {
        return nil;
    }
    
    NSString *name = components[0];
    CGFloat size = [components[1] doubleValue];
    
    return [UIFont fontWithName:name size:size];
}

@end
