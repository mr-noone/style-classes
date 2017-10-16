//
//  NSMutableDictionary+AdditionalTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 10.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSMutableDictionary+Additional.h"

@interface NSMutableDictionary_AdditionalTests : XCTestCase

@end

@implementation NSMutableDictionary_AdditionalTests

- (void)testSetObjectsFromDictionary {
    NSString *key1 = @"key1";
    NSString *key2 = @"key2";
    NSNumber *obj1 = @1;
    NSNumber *obj2 = @2;
    
    NSMutableDictionary<NSString *, NSNumber *> *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObjectsFromDictionary:@{key1: obj1, key2: obj2}];
    
    XCTAssertEqualObjects(dictionary[key1], obj1, @"The objects must be equal.");
    XCTAssertEqualObjects(dictionary[key2], obj2, @"The objects must be equal.");
}

@end
