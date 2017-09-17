//
//  UIColor+HexStringTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+Compare.h"
#import "UIColor+HexString.h"

@interface UIColor_HexStringTests : XCTestCase

@end

@implementation UIColor_HexStringTests

- (void)testColorFromHexRGB {
    UIColor *hexColor = [UIColor colorWithHexString:@"#a2b"];
    UIColor *color = [UIColor colorWithRed:0.67 green:0.13 blue:0.73 alpha:1.0];
    
    XCTAssertTrue([hexColor isEqualToColor:color], @"RGB Colors should be equal!");
}

- (void)testColorFromHexARGB {
    UIColor *hexColor = [UIColor colorWithHexString:@"#47ab"];
    UIColor *color = [UIColor colorWithRed:0.47 green:0.67 blue:0.73 alpha:0.27];
    
    XCTAssertTrue([hexColor isEqualToColor:color], @"ARGB Colors should be equal!");
}

- (void)testColorFromHexRRGGBB {
    UIColor *hexColor = [UIColor colorWithHexString:@"#77aabb"];
    UIColor *color = [UIColor colorWithRed:0.47 green:0.67 blue:0.73 alpha:1.0];
    
    XCTAssertTrue([hexColor isEqualToColor:color], @"RRGGBB Colors should be equal!");
}

- (void)testColorFromHexAARRGGBB {
    UIColor *hexColor = [UIColor colorWithHexString:@"#4477aabb"];
    UIColor *color = [UIColor colorWithRed:0.47 green:0.67 blue:0.73 alpha:0.27];
    
    XCTAssertTrue([hexColor isEqualToColor:color], @"AARRGGBB Colors should be equal!");
}

- (void)testHashTagSymbolInTheHEXStringInfluence {
    UIColor *hexColorWithHash = [UIColor colorWithHexString:@"#4477aabb"];
    UIColor *hexColorWithoutHash = [UIColor colorWithHexString:@"4477aabb"];
    UIColor *color = [UIColor colorWithRed:0.47 green:0.67 blue:0.73 alpha:0.27];
    
    XCTAssertTrue([hexColorWithHash isEqualToColor:color], @"AARRGGBB Colors should be equal!");
    XCTAssertTrue([hexColorWithoutHash isEqualToColor:color], @"AARRGGBB Colors should be equal!");
}

- (void)testColorWithInvalidHexString {
    UIColor *hexColor = [UIColor colorWithHexString:@"03ek./as"];
    XCTAssertNil(hexColor, @"Should be nil");
}

- (void)testColorToHEXStringARGB {
    NSString *hexString = @"#fa3475fb";
    UIColor *color = [UIColor colorWithHexString:hexString];
    
    XCTAssertEqualObjects(color.hexStringARGB, [hexString uppercaseString], @"Should be equal");
}

- (void)testColorHEXStringRGB {
    NSString *hexString = @"#3475fb";
    UIColor *color = [UIColor colorWithHexString:hexString];
    
    XCTAssertEqualObjects(color.hexStringRGB, [hexString uppercaseString], @"Should be equal");
}

@end
