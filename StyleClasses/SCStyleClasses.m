//
//  SCStyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "SCStyleClasses.h"

@implementation SCStyleClasses

#pragma mark - Init

- (instancetype)_init {
    return [super init];
}

+ (SCStyleClasses *)instance {
    static dispatch_once_t onceToken;
    static SCStyleClasses *instance;
    dispatch_once(&onceToken, ^{
        instance = [[super alloc] _init];
    });
    return instance;
}

#pragma mark - Configure

- (void)configureWithStylesheetName:(NSString *)stylesheetName {
    if (stylesheetName.length == 0) {
        [NSException raise:NSInvalidArgumentException format:@"The stylesheet name cannot be empty"];
    }
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *stylesheetPath = [bundle pathForResource:stylesheetName ofType:@"plist"];
    
    if (stylesheetPath.length == 0) {
        [NSException raise:NSFileNotFoundException format:@"File with name '%@' not found", stylesheetName];
    }
}

@end
