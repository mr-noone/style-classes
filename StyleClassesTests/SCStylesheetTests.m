//
//  SCStylesheetTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SCStylesheet.h"

@interface SCStylesheet (UnitTests)

@end

@interface SCStylesheetTests : XCTestCase

@property (strong, nonatomic) NSBundle *bundle;
@property (strong, nonatomic) NSString *stylesheetPath;

@end

@implementation SCStylesheetTests

- (void)setUp {
    [super setUp];
    
    self.bundle = [NSBundle bundleForClass:self.class];
    self.stylesheetPath = [self.bundle pathForResource:@"Style" ofType:@"plist"];
}

- (void)testInit {
    SCStylesheet *stylesheet = [[SCStylesheet alloc] initWithStylesheetPath:self.stylesheetPath
                                                                 withBundle:self.bundle];
    XCTAssertNotNil(stylesheet, @"");
}

- (void)testInitWithEmptyStylesheetPath {
    void(^initBlock)(void) = ^{
        __unused SCStylesheet *stylesheet =
        [[SCStylesheet alloc] initWithStylesheetPath:@"" withBundle:self.bundle];
    };
    XCTAssertThrowsSpecificNamed(initBlock(), NSException, NSInvalidArgumentException, @"The method must throw an exception if you pass an empty string.");
}

- (void)testInitWithBundleArgumentIsNil {
    void(^initBlock)(void) = ^{
        NSBundle *bundle = nil;
        __unused SCStylesheet *stylesheet =
        [[SCStylesheet alloc] initWithStylesheetPath:self.stylesheetPath withBundle:bundle];
    };
    XCTAssertThrowsSpecificNamed(initBlock(), NSException, NSInvalidArgumentException, @"The method must throw an exception if you pass the nil bundle.");
}

- (void)testInitWithInvalidFileFormat {
    void(^initBlock)(void) = ^{
        NSString *path = [self.bundle pathForResource:@"StyleInvalidFormat" ofType:@"plist"];
        __unused SCStylesheet *stylesheet =
        [[SCStylesheet alloc] initWithStylesheetPath:path withBundle:self.bundle];
    };
    XCTAssertThrowsSpecificNamed(initBlock(), NSException, NSGenericException, @"The method must throw an exception if the stylesheet file format is not valid.");
}

- (void)testInitWithInvalidRootObject {
    void(^initBlock)(void) = ^{
        NSString *path = [self.bundle pathForResource:@"StyleInvalidRoot" ofType:@"plist"];
        __unused SCStylesheet *stylesheet =
        [[SCStylesheet alloc] initWithStylesheetPath:path withBundle:self.bundle];
    };
    XCTAssertThrowsSpecificNamed(initBlock(), NSException, NSGenericException, @"The method must throw an exception if the root object is not a dictionary.");
}

@end
