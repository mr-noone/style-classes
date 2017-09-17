//
//  NSString+Geometry.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 16.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import <UIKit/UIGeometry.h>

@interface NSString (Geometry)

/**
 The CGPoint value of the string, assuming format "x, y",
 where x is the x coordinate and y is the y coordinate.
 The x and y values can represent integer or float values.
 This property is CGPointZero if string not match the format.
 */
@property (nonatomic, readonly) CGPoint CGPointValue;

/**
 The CGSize value of the string, assuming format "w, h",
 where w is the width and h is the height.
 The w and h values can be integer or float values.
 This property is CGSizeZero if string not match the format.
 */
@property (nonatomic, readonly) CGSize CGSizeValue;

/**
 The CGRect value of the string, assuming format "x, y, w, h",
 where x is the x coordinate, y is the y coordinate, w is the width, and h is the height.
 These components can represent integer or float values.
 This property is CGRectZero if string not match the format.
 */
@property (nonatomic, readonly) CGRect CGRectValue;

/**
 The UIEdgeInsets value of the string, assuming format "top, left, bottom, right",
 where top, left, bottom, right are the floating-point component values of the UIEdgeInsets structure.
 This property is UIEdgeInsetsZero if string not match the format.
 */
@property (nonatomic, readonly) UIEdgeInsets UIEdgeInsetsValue;

@end
