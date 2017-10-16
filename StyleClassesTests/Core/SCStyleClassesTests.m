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

@property (strong, nonatomic) NSBundle *bundle;
@property (strong, nonatomic) NSString *stylesheetName;

@end

@implementation SCStyleClassesTests

- (void)setUp {
    [super setUp];
    
    self.bundle = [NSBundle bundleForClass:self.class];
    self.stylesheetName = @"Style";
}

- (void)testShareInstance {
    XCTAssertNotNil(SCStyleClasses.instance, @"The 'instanse' property should not return nil.");
}

- (void)testConfigure {
    void(^configure)(void) = ^{
        [SCStyleClasses.instance configureWithStylesheetName:self.stylesheetName withBundle:self.bundle];
    };
    XCTAssertNoThrow(configure());
}

- (void)testConfigureWithEmptyStylesheetName {
    void(^configure)(void) = ^{
        [SCStyleClasses.instance configureWithStylesheetName:@"" withBundle:self.bundle];
    };
    XCTAssertThrowsSpecificNamed(configure(), NSException, NSInvalidArgumentException, @"The method should throw an exception if you pass an empty string.");
}

- (void)testConfigureWithBundleArgumentIsNil {
    void(^configure)(void) = ^{
        NSBundle *bundle = nil;
        [SCStyleClasses.instance configureWithStylesheetName:self.stylesheetName withBundle:bundle];
    };
    XCTAssertThrowsSpecificNamed(configure(), NSException, NSInvalidArgumentException, @"The method should throw an exception if you pass a nil bundle.");
}

- (void)testConfigureWithStylesheetFileNotFound {
    void(^configure)(void) = ^{
        [SCStyleClasses.instance configureWithStylesheetName:@"NotFound" withBundle:self.bundle];
    };
    XCTAssertThrowsSpecificNamed(configure(), NSException, NSFileNotFoundException, @"The method should throw an exception if the file is not found.");
}

@end
