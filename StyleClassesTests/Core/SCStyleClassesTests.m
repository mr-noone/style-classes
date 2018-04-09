//
//  SCStyleClassesTests.m
//  StyleClassesTests
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SCStyleClasses.h"
#import "SCStyleClass.h"
#import "UIView+StyleClasses.h"

@interface UTStyleClass : NSObject <SCStyleClass>
@property (assign, nonatomic) BOOL isApplyStyle;
@end

@implementation UTStyleClass
@synthesize styleClass;

- (void)setNeedsUpdateStyle {}

- (void)updateWithStyle:(nonnull SCStyle *)style {
    self.isApplyStyle = YES;
}

@end

@interface UTView : UIView
@property (assign, nonatomic) BOOL isApplyStyle;
@end

@implementation UTView

- (void)updateWithStyle:(SCStyle *)style {
    self.isApplyStyle = YES;
}

@end

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

- (void)testDidMoveToWindow {
    [SCStyleClasses.instance configureWithStylesheetName:self.stylesheetName withBundle:self.bundle];
    
    UTStyleClass *object = UTStyleClass.new;
    object.styleClass = @"View";
    
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center postNotificationName:SCDidMoveToWindowNotification object:object];
    
    XCTAssertTrue(object.isApplyStyle);
}

- (void)testNeedsUpdateStyle {
    [SCStyleClasses.instance configureWithStylesheetName:self.stylesheetName withBundle:self.bundle];
    
    UTView *rootView = UTView.new;
    UTView *subview1 = UTView.new;
    UTView *subview2 = UTView.new;
    rootView.styleClass = @"View";
    subview1.styleClass = @"View";
    subview2.styleClass = @"View";
    [rootView addSubview:subview1];
    [subview1 addSubview:subview2];
    
    [rootView setNeedsUpdateStyle];
    
    XCTAssertTrue(rootView.isApplyStyle);
    XCTAssertTrue(subview1.isApplyStyle);
    XCTAssertTrue(subview2.isApplyStyle);
}

@end
