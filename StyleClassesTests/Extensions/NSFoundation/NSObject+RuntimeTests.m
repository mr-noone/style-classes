//
//  NSObject+RuntimeTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 16.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+Runtime.h"

@interface SwizzleTestClass : NSObject

+ (BOOL)isSwizzleClassMethod;
- (BOOL)isSwizzleInstanceMethod;

@end

@implementation SwizzleTestClass

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleClassMethod:@selector(isSwizzleClassMethod) withMethod:@selector(ut_isSwizzleClassMethod)];
        [self swizzleInstanceMethod:@selector(isSwizzleInstanceMethod) withMethod:@selector(ut_isSwizzleInstanceMethod)];
    });
}

+ (BOOL)isSwizzleClassMethod {
    return NO;
}

+ (BOOL)ut_isSwizzleClassMethod {
    return YES;
}

- (BOOL)isSwizzleInstanceMethod {
    return NO;
}

- (BOOL)ut_isSwizzleInstanceMethod {
    return YES;
}

@end

@interface NSObject_RuntimeTests : XCTestCase

@end

@implementation NSObject_RuntimeTests

- (void)testSwizzleClassMethod {
    XCTAssertTrue(SwizzleTestClass.isSwizzleClassMethod, @"Should be call swizzled method");
}

- (void)testSwizzleInstanceMethod {
    SwizzleTestClass *swizzleTestClass = [SwizzleTestClass new];
    XCTAssertTrue(swizzleTestClass.isSwizzleInstanceMethod, @"Should be call swizzled method");
}

@end
