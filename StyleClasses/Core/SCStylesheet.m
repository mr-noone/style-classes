//
//  SCStylesheet.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "SCStylesheet.h"
#import "SCStyle.h"
#import "SCStyle+Private.h"

#import "NSMutableDictionary+Additional.h"

@interface SCStylesheet ()

@property (strong, nonatomic) NSBundle *bundle;

@property (strong, nonatomic) NSDictionary<NSString *, id> *constants;
@property (strong, nonatomic) NSDictionary<NSString *, NSDictionary *> *stylesheet;
@property (strong, nonatomic) NSMutableDictionary<NSString *, SCStyle *> *styles;

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
    self.styles = [NSMutableDictionary dictionary];
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
        } else if ([self isConstant:key]) {
            [constants setObject:obj forKey:key];
        } else if ([obj isKindOfClass:NSDictionary.class]) {
            [stylesheet setObject:obj forKey:key];
        }
    }];
    
    self.constants = [NSDictionary dictionaryWithDictionary:constants];
    self.stylesheet = [NSDictionary dictionaryWithDictionary:stylesheet];
}

- (NSDictionary *)propertiesForStyleClass:(NSString *)styleClass {
    NSMutableDictionary *properties = [NSMutableDictionary dictionary];
    
    NSArray<NSString *> *classes = [styleClass componentsSeparatedByString:@"."];
    for (NSString *class in classes) {
        NSDictionary *styleProps = [self.stylesheet objectForKey:class];
        [properties setObjectsFromDictionary:styleProps];
    }
    
    [properties enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([self isConstant:obj]) {
            [properties setObject:self.constants[obj] forKey:key];
        }
    }];
    
    return properties;
}

- (BOOL)isConstant:(nonnull NSString *)key {
    if ([key isKindOfClass:[NSString class]]) {
        return [[key substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"$"];
    }
    
    return NO;
}

#pragma mark - Public

- (SCStyle *)styleForStyleClass:(NSString *)styleClass {
    SCStyle *style = [self.styles objectForKey:styleClass];
    
    if (style == nil) {
        NSDictionary *properties = [self propertiesForStyleClass:styleClass];
        style = [[SCStyle alloc] initWithStyleClass:styleClass
                                withStyleProperties:properties
                                         withBundle:self.bundle];
        [self.styles setObject:style forKey:styleClass];
    }
    
    return style;
}

@end
