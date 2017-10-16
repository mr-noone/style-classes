//
//  SCStyleTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Geometry.h"
#import "UIFont+String.h"
#import "UIColor+HexString.h"
#import "SCStyle.h"

@interface SCStyleTests : XCTestCase

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) id value;
@property (strong, nonatomic) SCStyle *style;

@end

@implementation SCStyleTests

- (void)setUpWithKey:(NSString *)key withValue:(id)value {
    self.key = key;
    self.value = value;
    
    self.style = [[SCStyle alloc] initWithStyleClass:@"Class"
                                 withStyleProperties:@{self.key: self.value}
                                          withBundle:[NSBundle bundleForClass:self.class]];
}

- (void)tearDown {
    self.key = nil;
    self.value = nil;
    self.style = nil;
    [super tearDown];
}

- (void)testInit {
    XCTAssertNotNil([[SCStyle alloc] initWithStyleClass:@""
                                    withStyleProperties:@{}
                                             withBundle:NSBundle.mainBundle]);
}

- (void)testValueForKey {
    [self setUpWithKey:@"valueKey" withValue:@"value"];
    
    __block id aValue;
    [self.style valueForKey:self.key inBlock:^(id value) {
        aValue = value;
    }];
    
    XCTAssertNotNil(aValue, @"Must be return '%@' for '%@' key", self.value, self.key);
}

- (void)testBoolForKey {
    [self setUpWithKey:@"boolValue" withValue:@YES];
    
    __block BOOL boolValue;
    [self.style boolForKey:self.key inBlock:^(BOOL value) {
        boolValue = value;
    }];
    
    XCTAssertTrue(boolValue, @"Must be return YES for '%@' key", self.key);
}

- (void)testFloatForKey {
    [self setUpWithKey:@"floatValue" withValue:@1.5];
    
    __block CGFloat floatValue;
    [self.style floatForKey:self.key inBlock:^(CGFloat value) {
        floatValue = value;
    }];
    
    XCTAssertEqual(floatValue, [self.value doubleValue], @"Must be return '%@' for '%@' key", self.value, self.key);
}

- (void)testIntegerForKey {
    [self setUpWithKey:@"integerValue" withValue:@14];
    
    __block NSInteger integerValue;
    [self.style integerForKey:self.key inBlock:^(NSInteger value) {
        integerValue = value;
    }];
    
    XCTAssertEqual(integerValue, [self.value integerValue], @"Must be return '%@' for '%@' key", self.value, self.key);
}

- (void)testPointForKey {
    CGFloat x = 13.0;
    CGFloat y = 54.0;
    
    [self setUpWithKey:@"pointValue" withValue:[NSString stringWithFormat:@"%f,%f", x, y]];
    
    __block CGPoint pointValue;
    [self.style pointForKey:self.key inBlock:^(CGPoint value) {
        pointValue = value;
    }];
    
    NSString *value = NSStringFromCGPoint([self.value CGPointValue]);
    
    XCTAssertTrue(pointValue.x == x && pointValue.y == y, @"Must be return '%@' for '%@' key", value, self.key);
}

- (void)testSizeForKey {
    CGFloat width = 123.0;
    CGFloat height = 342.0;
    
    [self setUpWithKey:@"sizeValue" withValue:[NSString stringWithFormat:@"%f,%f", width, height]];
    
    __block CGSize sizeValue;
    [self.style sizeForKey:self.key inBlock:^(CGSize value) {
        sizeValue = value;
    }];
    
    NSString *value = NSStringFromCGSize([self.value CGSizeValue]);
    
    XCTAssertTrue(sizeValue.width == width && sizeValue.height == height, @"Must be return '%@' for '%@' key", value, self.key);
}

- (void)testRectForKey {
    CGFloat x = 13.0;
    CGFloat y = 54.0;
    CGFloat w = 123.0;
    CGFloat h = 342.0;
    
    NSString *value = [NSString stringWithFormat:@"%f,%f,%f,%f", x, y, w, h];
    [self setUpWithKey:@"rectValue" withValue:value];
    
    __block CGRect rectValue;
    [self.style rectForKey:self.key inBlock:^(CGRect value) {
        rectValue = value;
    }];
    
    value = NSStringFromCGRect([self.value CGRectValue]);
    
    BOOL equal = (rectValue.origin.x == x &&
                  rectValue.origin.y == y &&
                  rectValue.size.width == w &&
                  rectValue.size.height == h);
    
    XCTAssertTrue(equal, @"Must be return '%@' for '%@' key", value, self.key);
    
}

- (void)testEdgeInsetsForKey {
    CGFloat top = 32.0;
    CGFloat left = 342.0;
    CGFloat bottom = 61.0;
    CGFloat right = 54.0;
    
    NSString *value = [NSString stringWithFormat:@"%f,%f,%f,%f", top, left, bottom, right];
    [self setUpWithKey:@"edgeInsetsValue" withValue:value];
    
    __block UIEdgeInsets edgeInsetsValue;
    [self.style edgeInsetsForKey:self.key inBlock:^(UIEdgeInsets value) {
        edgeInsetsValue = value;
    }];
    
    value = NSStringFromUIEdgeInsets([self.value UIEdgeInsetsValue]);
    
    BOOL equal = (edgeInsetsValue.top == top &&
                  edgeInsetsValue.left == left &&
                  edgeInsetsValue.bottom == bottom &&
                  edgeInsetsValue.right == right);
    
    XCTAssertTrue(equal, @"Must be return '%@' for '%@' key", value, self.key);
}

- (void)testNumberForKey {
    [self setUpWithKey:@"numberValue" withValue:@34699];
    
    __block NSNumber *numberValue;
    [self.style numberForKey:self.key inBlock:^(NSNumber *value) {
        numberValue = value;
    }];
    
    XCTAssertEqualObjects(numberValue, self.value, @"Must be return '%@' for '%@' key", self.value, self.key);
}

- (void)testStringForKey {
    [self setUpWithKey:@"stringValue" withValue:@"string"];
    
    __block NSString *stringValue;
    [self.style stringForKey:self.key inBlock:^(NSString *value) {
        stringValue = value;
    }];
    
    XCTAssertEqualObjects(stringValue, self.value, @"Must be return '%@' for '%@' key", self.value, self.key);
}

- (void)testImageForKey {
    [self setUpWithKey:@"imageValue" withValue:@"image"];
    
    __block UIImage *imageValue;
    [self.style imageForKey:self.key inBlock:^(UIImage *value) {
        imageValue = value;
    }];
    
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    UIImage *image = [UIImage imageNamed:self.value inBundle:bundle compatibleWithTraitCollection:nil];
    
    XCTAssertEqualObjects(imageValue, image, @"Must be return image with name '%@'", self.value);
}

- (void)testFontForKey {
    [self setUpWithKey:@"fontValue" withValue:@"Helvetica-Light, 11"];
    
    __block UIFont *fontValue;
    [self.style fontForKey:self.key inBlock:^(UIFont *value) {
        fontValue = value;
    }];
    
    UIFont *font = [UIFont fontFromString:self.value];
    XCTAssertEqualObjects(fontValue, font, @"Must be return '%@' for '%@' key", font, self.key);
}

- (void)testColorForKey {
    [self setUpWithKey:@"colorValue" withValue:@"#2b2a2f"];
    
    __block UIColor *colorValue;
    [self.style colorForKey:self.key inBlock:^(UIColor *value) {
        colorValue = value;
    }];
    
    UIColor *color = [UIColor colorWithHexString:self.value];
    XCTAssertEqualObjects(colorValue, color, @"Must be return '%@' for '%@' key", color, self.key);
}

@end
