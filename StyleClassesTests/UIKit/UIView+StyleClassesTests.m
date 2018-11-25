//
//  UIView+StyleClassesTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 16.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SCStyle+Private.h"
#import "UIView+StyleClasses.h"
#import "UIColor+Compare.h"

@interface UIView_StyleClassesTests : XCTestCase

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) id value;
@property (strong, nonatomic) SCStyle *style;
@property (strong, nonatomic) UIView *view;

@end

@implementation UIView_StyleClassesTests

- (void)setUpWithKey:(NSString *)key withValue:(id)value {
    self.view = UIView.new;
    self.key = key;
    self.value = value;
    
    self.style = [[SCStyle _alloc] initWithStyleClass:@"Class"
                                  withStyleProperties:@{self.key: self.value}
                                           withBundle:[NSBundle bundleForClass:self.class]];
    [self.view updateWithStyle:self.style];
}

- (void)tearDown {
    self.view = nil;
    self.key = nil;
    self.value = nil;
    self.style = nil;
    [super tearDown];
}

- (void)testStyleClassProperty {
    NSString *styleClass = @"View";
    UIView *view = [UIView new];
    view.styleClass = styleClass;
    XCTAssertEqualObjects(view.styleClass, styleClass);
}

- (void)testDidMoveToWindow {
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    void(^observerBlock)(NSNotification *) = ^(NSNotification *notification) {
        XCTAssertNotNil(notification.object);
        [expectation fulfill];
    };
    
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center addObserverForName:SCDidMoveToWindowNotification
                        object:nil
                         queue:nil
                    usingBlock:observerBlock];
    
    [UIView.new didMoveToWindow];
    
    [self waitForExpectationsWithTimeout:1.0 handler:^(NSError *error) {
        XCTAssertNil(error);
    }];
}

- (void)testSetNeedsUpdateStyle {
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    void(^observerBlock)(NSNotification *) = ^(NSNotification *notification) {
        XCTAssertNotNil(notification.object);
        [expectation fulfill];
    };
    
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center addObserverForName:SCNeedsUpdateStyleNotification
                        object:nil
                         queue:nil
                    usingBlock:observerBlock];
    
    [UIView.new setNeedsUpdateStyle];
    
    [self waitForExpectationsWithTimeout:1.0 handler:^(NSError *error) {
        XCTAssertNil(error);
    }];
}

#pragma mark - Test style properties

- (void)testBackgroundColor {
    [self setUpWithKey:@"background-color" withValue:@"FF0000"];
    XCTAssertTrue([self.view.backgroundColor isEqualToColor:UIColor.redColor]);
}

- (void)testTintColor {
    [self setUpWithKey:@"tint-color" withValue:@"00ff00"];
    XCTAssertTrue([self.view.tintColor isEqualToColor:UIColor.greenColor]);
}

- (void)testAlpha {
    [self setUpWithKey:@"alpha" withValue:@0.75];
    XCTAssertEqual(self.view.alpha, 0.75);
}

- (void)testClipsToBounds {
    [self setUpWithKey:@"clips-to-bounds" withValue:@YES];
    XCTAssertEqual(self.view.clipsToBounds, YES);
}

- (void)testBorderColor {
    [self setUpWithKey:@"border-color" withValue:@"0000ff"];
    XCTAssertTrue([[UIColor colorWithCGColor:self.view.layer.borderColor] isEqualToColor:UIColor.blueColor]);
}

- (void)testBorderWidth {
    [self setUpWithKey:@"border-width" withValue:@23];
    XCTAssertEqual(self.view.layer.borderWidth, 23);
}

- (void)testCornerRadius {
    [self setUpWithKey:@"corner-radius" withValue:@3];
    XCTAssertEqual(self.view.layer.cornerRadius, 3);
}

- (void)testShadowOpacity {
    [self setUpWithKey:@"shadow-opacity" withValue:@0.98];
    XCTAssertEqual(self.view.layer.shadowOpacity, 0.98f);
}

- (void)testShadowRadius {
    [self setUpWithKey:@"shadow-radius" withValue:@12];
    XCTAssertEqual(self.view.layer.shadowRadius, 12);
}

- (void)testShadowOffset {
    [self setUpWithKey:@"shadow-offset" withValue:@"10, 10"];
    XCTAssertEqual(self.view.layer.shadowOffset.width, 10);
    XCTAssertEqual(self.view.layer.shadowOffset.height, 10);
}

- (void)testShadowColor {
    [self setUpWithKey:@"shadow-color" withValue:@"FFFFFF"];
    XCTAssertTrue([[UIColor colorWithCGColor:self.view.layer.shadowColor] isEqualToColor:UIColor.whiteColor]);
}

@end
