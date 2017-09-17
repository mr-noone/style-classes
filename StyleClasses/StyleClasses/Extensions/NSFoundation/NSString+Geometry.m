//
//  NSString+Geometry.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 16.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "NSString+Geometry.h"
#import <UIKit/UIGeometry.h>

@implementation NSString (Geometry)

- (CGPoint)CGPointValue {
    return CGPointFromString([NSString stringWithFormat:@"{%@}", self]);
}

- (CGSize)CGSizeValue {
    return CGSizeFromString([NSString stringWithFormat:@"{%@}", self]);
}

- (CGRect)CGRectValue {
    NSArray *components = [self componentsSeparatedByString:@","];
    
    if (components.count != 4) {
        return CGRectZero;
    }
    
    NSString *x = components[0];
    NSString *y = components[1];
    NSString *w = components[2];
    NSString *h = components[3];
    
    NSString *rectString = [NSString stringWithFormat:@"{{%@,%@},{%@,%@}}", x, y, w, h];
    
    return CGRectFromString(rectString);
}

- (UIEdgeInsets)UIEdgeInsetsValue {
    NSArray *components = [self componentsSeparatedByString:@","];
    
    if (components.count != 4) {
        return UIEdgeInsetsZero;
    }
    
    NSString *top = components[0];
    NSString *left = components[1];
    NSString *bottom = components[2];
    NSString *right = components[3];
    
    NSString *edgeInsetsString = [NSString stringWithFormat:@"{%@,%@,%@,%@}", top, left, bottom, right];
    
    return UIEdgeInsetsFromString(edgeInsetsString);
}

@end
