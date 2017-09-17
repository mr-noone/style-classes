//
//  SCStyleClassesTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SCStyleClasses.h"

@interface SCStyleClassesTests : XCTestCase

@end

@implementation SCStyleClassesTests

- (void)testShareInstance {
    XCTAssertNotNil(SCStyleClasses.instance, @"The 'instanse' property should not return nil.");
}

- (void)testConfigureWithEmptyStylesheetName {
    XCTAssertThrowsSpecificNamed([SCStyleClasses.instance configureWithStylesheetName:@""], NSException, NSInvalidArgumentException,
                                 @"The method should throw an exception if you pass an empty string.");
}

- (void)testConfigureWithoutStylesheetFile {
    XCTAssertThrowsSpecificNamed([SCStyleClasses.instance configureWithStylesheetName:@"WithoutStyle"], NSException, NSFileNotFoundException,
                                 @"The method should throw an exception if the file is not found.");
}

@end
