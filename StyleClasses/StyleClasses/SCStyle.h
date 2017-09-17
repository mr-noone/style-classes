//
//  SCStyle.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import <UIKit/UIGeometry.h>

@class UIImage;
@class UIFont;
@class UIColor;

NS_ASSUME_NONNULL_BEGIN

typedef void(^SCStyleValueBlock)(id value);

typedef void(^SCStyleBoolBlock)(BOOL value);
typedef void(^SCStyleFloatValue)(CGFloat value);
typedef void(^SCStyleIntegerValue)(NSInteger value);

typedef void(^SCStylePointValue)(CGPoint value);
typedef void(^SCStyleSizeValue)(CGSize value);
typedef void(^SCStyleRectValue)(CGRect value);
typedef void(^SCStyleEdgeInsetsValue)(UIEdgeInsets value);

typedef void(^SCStyleNumberValue)(NSNumber *value);
typedef void(^SCStyleStringValue)(NSString *value);
typedef void(^SCStyleImageValue)(UIImage *value);
typedef void(^SCStyleFontValue)(UIFont *value);
typedef void(^SCStyleColorValue)(UIColor *value);

@interface SCStyle : NSObject

- (instancetype)initWithStyleClass:(NSString *)styleClass
               withStyleProperties:(NSDictionary *)styleProperties
                        withBundle:(NSBundle *)bundle;

- (void)valueForKey:(NSString *)key inBlock:(SCStyleValueBlock)block;

- (void)boolForKey:(NSString *)key inBlock:(SCStyleBoolBlock)block;
- (void)floatForKey:(NSString *)key inBlock:(SCStyleFloatValue)block;
- (void)integerForKey:(NSString *)key inBlock:(SCStyleIntegerValue)block;

- (void)pointForKey:(NSString *)key inBlock:(SCStylePointValue)block;
- (void)sizeForKey:(NSString *)key inBlock:(SCStyleSizeValue)block;
- (void)rectForKey:(NSString *)key inBlock:(SCStyleRectValue)block;
- (void)edgeInsetsForKey:(NSString *)key inBlock:(SCStyleEdgeInsetsValue)block;

- (void)numberForKey:(NSString *)key inBlock:(SCStyleNumberValue)block;
- (void)stringForKey:(NSString *)key inBlock:(SCStyleStringValue)block;
- (void)imageForKey:(NSString *)key inBlock:(SCStyleImageValue)block;
- (void)fontForKey:(NSString *)key inBlock:(SCStyleFontValue)block;
- (void)colorForKey:(NSString *)key inBlock:(SCStyleColorValue)block;

@end
                    
NS_ASSUME_NONNULL_END
