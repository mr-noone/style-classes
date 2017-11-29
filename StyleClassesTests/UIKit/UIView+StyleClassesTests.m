//
//  UIView+StyleClassesTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 16.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIView+StyleClasses.h"

@interface UIView_StyleClassesTests : XCTestCase

@end

@implementation UIView_StyleClassesTests

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

@end
