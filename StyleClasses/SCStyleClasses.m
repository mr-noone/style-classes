//
//  SCStyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "SCStyleClasses.h"
#import "SCStylesheet.h"

@interface SCStyleClasses ()

@property (strong, nonatomic) NSBundle *bundle;
@property (strong, nonatomic) SCStylesheet *stylesheet;

@end

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

- (void)configureWithStylesheetName:(NSString *)stylesheetName withBundle:(NSBundle *)bundle {
    if (stylesheetName.length == 0) {
        [NSException raise:NSInvalidArgumentException format:@"The stylesheet name cannot be empty"];
    }
    
    if (bundle == nil) {
        [NSException raise:NSInvalidArgumentException format:@"The bundle cannot be nil"];
    }
    
    self.bundle = bundle;
    NSString *stylesheetPath = [bundle pathForResource:stylesheetName ofType:@"plist"];
    
    if (stylesheetPath.length == 0) {
        [NSException raise:NSFileNotFoundException format:@"File with name '%@' not found", stylesheetName];
    }
    
    self.stylesheet = [[SCStylesheet alloc] initWithStylesheetPath:stylesheetPath
                                                        withBundle:self.bundle];
}

@end
