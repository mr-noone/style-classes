//
//  SCStyle.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "SCStyle.h"

#import "NSString+Geometry.h"
#import "UIFont+String.h"
#import "UIColor+HexString.h"

#import <UIKit/UIImage.h>

@interface SCStyle ()

@property (copy, nonatomic) NSString *styleClass;
@property (copy, nonatomic) NSDictionary *styleProperties;

@property (strong, nonatomic) NSBundle *bundle;

@end

@implementation SCStyle

#pragma mark - Init

- (instancetype)initWithStyleClass:(NSString *)styleClass
               withStyleProperties:(NSDictionary *)styleProperties
                        withBundle:(NSBundle *)bundle {
    
    self = [super init];
    
    self.styleClass = styleClass;
    self.styleProperties = styleProperties;
    self.bundle = bundle;
    
    return self;
}

#pragma mark - Value methods

- (void)valueForKey:(NSString *)key inBlock:(SCStyleValueBlock)block {
    id value = [self.styleProperties objectForKey:key];
    if (value) {
        block(value);
    }
}

- (void)boolForKey:(NSString *)key inBlock:(SCStyleBoolBlock)block {
    [self numberForKey:key inBlock:^(NSNumber *value) {
        if (strcmp([(NSNumber *)value objCType], @encode(char)) == 0) {
            block([value boolValue]);
        }
    }];
}

- (void)floatForKey:(NSString *)key inBlock:(SCStyleFloatValue)block {
    [self numberForKey:key inBlock:^(NSNumber *value) {
        block(value.doubleValue);
    }];
}

- (void)integerForKey:(NSString *)key inBlock:(SCStyleIntegerValue)block {
    [self numberForKey:key inBlock:^(NSNumber *value) {
        block(value.integerValue);
    }];
}

- (void)pointForKey:(NSString *)key inBlock:(SCStylePointValue)block {
    [self stringForKey:key inBlock:^(NSString *value) {
        block(value.CGPointValue);
    }];
}

- (void)sizeForKey:(NSString *)key inBlock:(SCStyleSizeValue)block {
    [self stringForKey:key inBlock:^(NSString *value) {
        block(value.CGSizeValue);
    }];
}

- (void)rectForKey:(NSString *)key inBlock:(SCStyleRectValue)block {
    [self stringForKey:key inBlock:^(NSString *value) {
        block(value.CGRectValue);
    }];
}

- (void)edgeInsetsForKey:(NSString *)key inBlock:(SCStyleEdgeInsetsValue)block {
    [self stringForKey:key inBlock:^(NSString * _Nonnull value) {
        block(value.UIEdgeInsetsValue);
    }];
}

- (void)numberForKey:(NSString *)key inBlock:(SCStyleNumberValue)block {
    [self valueForKey:key inBlock:^(id value) {
        if ([value isKindOfClass:NSNumber.class]) {
            block(value);
        }
    }];
}

- (void)stringForKey:(NSString *)key inBlock:(SCStyleStringValue)block {
    [self valueForKey:key inBlock:^(id value) {
        if ([value isKindOfClass:NSString.class]) {
            block(value);
        }
    }];
}

- (void)imageForKey:(NSString *)key inBlock:(SCStyleImageValue)block {
    [self stringForKey:key inBlock:^(NSString *value) {
        UIImage *image = [UIImage imageNamed:value
                                    inBundle:self.bundle
               compatibleWithTraitCollection:nil];
        if (image) {
            block(image);
        }
    }];
}

- (void)fontForKey:(NSString *)key inBlock:(SCStyleFontValue)block {
    [self stringForKey:key inBlock:^(NSString *value) {
        UIFont *font = [UIFont fontFromString:value];
        if (font) {
            block(font);
        }
    }];
}

- (void)colorForKey:(NSString *)key inBlock:(SCStyleColorValue)block {
    [self stringForKey:key inBlock:^(NSString *value) {
        UIColor *color = [UIColor colorWithHexString:value];
        if (color) {
            block(color);
        }
    }];
}

@end
