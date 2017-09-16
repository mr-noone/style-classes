//
//  UIColor+Compare.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "UIColor+Compare.h"

@implementation UIColor (Compare)

- (BOOL)isEqualToColor:(UIColor *)color {
    CGFloat r1, g1, b1, a1, r2, g2, b2, a2;
    [self getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    return (fabs(((round(r1 * 100)) / 100.0) - ((round(r2 * 100)) / 100.0)) == 0.0f &&
            fabs(((round(g1 * 100)) / 100.0) - ((round(g2 * 100)) / 100.0)) == 0.0f &&
            fabs(((round(b1 * 100)) / 100.0) - ((round(b2 * 100)) / 100.0)) == 0.0f &&
            fabs(((round(a1 * 100)) / 100.0) - ((round(a2 * 100)) / 100.0)) == 0.0f);
}

@end
