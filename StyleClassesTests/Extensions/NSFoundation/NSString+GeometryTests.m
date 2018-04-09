//
//  NSString+Geometry.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 16.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Geometry.h"

@interface NSString_GeometryTests : XCTestCase

@end

@implementation NSString_GeometryTests

- (void)testCGPointValue {
    CGPoint originPoint = CGPointMake(2.3, 3.0);
    NSString *pointString = [NSString stringWithFormat:@"%f, %f", originPoint.x, originPoint.y];
    XCTAssertTrue(CGPointEqualToPoint(pointString.CGPointValue, originPoint), @"The points must be equal.");
}

- (void)testCGSizeValue {
    CGSize originSize = CGSizeMake(20.0, 43.0);
    NSString *sizeString = [NSString stringWithFormat:@"%f, %f", originSize.width, originSize.height];
    XCTAssertTrue(CGSizeEqualToSize(sizeString.CGSizeValue, originSize), @"The sizes must be equal");
}

- (void)testCGRectValue {
    CGRect originRect = CGRectMake(2.0, 13.0, 123.0, 432.0);
    
    CGFloat x = originRect.origin.x;
    CGFloat y = originRect.origin.y;
    CGFloat w = originRect.size.width;
    CGFloat h = originRect.size.height;
    
    NSString *rectString = [NSString stringWithFormat:@"%f, %f, %f, %f", x, y, w, h];
    
    XCTAssertTrue(CGRectEqualToRect(rectString.CGRectValue, originRect), @"The rects must be equal");
}

- (void)testCGRectValueInvalid {
    XCTAssertTrue(CGRectEqualToRect(@"20.0".CGRectValue, CGRectZero), @"Must return 'CGRectZero' if string has invalid format.");
}

- (void)testUIEdgeInsetsValue {
    UIEdgeInsets originEdgeInsets = UIEdgeInsetsMake(10.0, 43.0, 83.0, 732.0);
    
    CGFloat top = originEdgeInsets.top;
    CGFloat left = originEdgeInsets.left;
    CGFloat bottom = originEdgeInsets.bottom;
    CGFloat right = originEdgeInsets.right;
    
    NSString *edgeInsetsString = [NSString stringWithFormat:@"%f, %f, %f, %f", top, left, bottom, right];
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(edgeInsetsString.UIEdgeInsetsValue, originEdgeInsets), @"Must be equal");
}

- (void)testUIEdgeInsetsValueInvalid {
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(@"20.0".UIEdgeInsetsValue, UIEdgeInsetsZero), @"Must return 'CGRectZero' if string has invalid format.");
}

@end
