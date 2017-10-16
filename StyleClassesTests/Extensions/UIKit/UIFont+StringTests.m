//
//  UIFont+StringTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIFont+String.h"

@interface UIFont_StringTests : XCTestCase

@end

@implementation UIFont_StringTests

- (void)testFontFromString {
    UIFont *font = [UIFont fontFromString:@"Helvetica-Light, 12.0"];
    XCTAssertEqualObjects(font, [UIFont fontWithName:@"Helvetica-Light" size:12.0]);
}

- (void)testFontFromStringInvalidFormat {
    UIFont *font = [UIFont fontFromString:@"Helvetica"];
    XCTAssertNil(font, @"Must return nil if string has invalid format.");
}

@end
