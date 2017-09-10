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

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

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
