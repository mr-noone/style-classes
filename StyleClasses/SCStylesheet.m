//
//  SCStylesheet.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "SCStylesheet.h"

@interface SCStylesheet ()

@property (strong, nonatomic) NSBundle *bundle;

@property (strong, nonatomic) NSDictionary *constants;
@property (strong, nonatomic) NSDictionary *stylesheet;

@end

@implementation SCStylesheet

#pragma mark - Init

- (instancetype)initWithStylesheetPath:(NSString *)stylesheetPath
                            withBundle:(NSBundle *)bundle {
    
    if (stylesheetPath.length == 0) {
        [NSException raise:NSInvalidArgumentException format:@"The stylesheet path cannot be empty"];
    }
    
    if (bundle == nil) {
        [NSException raise:NSInvalidArgumentException format:@"The bundle cannot be nil"];
    }
    
    self = [super init];
    self.bundle = bundle;
    [self parseStylesheetWithPath:stylesheetPath];
    return self;
}

#pragma mark - Private

- (void)parseStylesheetWithPath:(NSString *)stylesheetPath {
    NSData *stylesheetData = [NSData dataWithContentsOfFile:stylesheetPath];
    
    NSError *parseError;
    id parsedData = [NSPropertyListSerialization propertyListWithData:stylesheetData
                                                              options:NSPropertyListImmutable
                                                               format:NULL
                                                                error:&parseError];
    
    if (parseError) {
        [NSException raise:NSGenericException format:@"%@", parseError.localizedDescription];
    }
    
    if ([parsedData isKindOfClass:NSDictionary.class] == NO) {
        [NSException raise:NSGenericException format:@"The stylesheet root object must be dictionary"];
    }
    
    NSMutableDictionary *constants = [NSMutableDictionary dictionary];
    NSMutableDictionary *stylesheet = [NSMutableDictionary dictionary];
    
    [(NSDictionary *)parsedData enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        if (key.length == 0) {
            return;
        } else if ([[key substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"$"]) {
            [constants setObject:obj forKey:key];
        } else if ([obj isKindOfClass:NSDictionary.class]) {
            [stylesheet setObject:obj forKey:key];
        }
    }];
    
    self.constants = [NSDictionary dictionaryWithDictionary:constants];
    self.stylesheet = [NSDictionary dictionaryWithDictionary:stylesheet];
}

@end
