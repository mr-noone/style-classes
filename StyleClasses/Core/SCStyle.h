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

typedef void(^SCStyleValueBlock)(id value) NS_SWIFT_NAME(Style.Value);

typedef void(^SCStyleBoolBlock)(BOOL value) NS_SWIFT_NAME(Style.Bool);
typedef void(^SCStyleFloatValue)(CGFloat value) NS_SWIFT_NAME(Style.Float);
typedef void(^SCStyleIntegerValue)(NSInteger value) NS_SWIFT_NAME(Style.Int);

typedef void(^SCStylePointValue)(CGPoint value) NS_SWIFT_NAME(Style.Point);
typedef void(^SCStyleSizeValue)(CGSize value) NS_SWIFT_NAME(Style.Size);
typedef void(^SCStyleRectValue)(CGRect value) NS_SWIFT_NAME(Style.Rect);
typedef void(^SCStyleEdgeInsetsValue)(UIEdgeInsets value) NS_SWIFT_NAME(Style.EdgeInsets);

typedef void(^SCStyleNumberValue)(NSNumber *value) NS_SWIFT_UNAVAILABLE("");
typedef void(^SCStyleStringValue)(NSString *value) NS_SWIFT_NAME(Style.String);
typedef void(^SCStyleImageValue)(UIImage *value) NS_SWIFT_NAME(Style.Image);
typedef void(^SCStyleFontValue)(UIFont *value) NS_SWIFT_NAME(Style.Font);
typedef void(^SCStyleColorValue)(UIColor *value) NS_SWIFT_NAME(Style.Color);

NS_SWIFT_NAME(Style)
@interface SCStyle : NSObject

+ (nonnull instancetype)new __attribute__((unavailable("")));
+ (nonnull instancetype)alloc __attribute__((unavailable("")));
- (nonnull instancetype)init __attribute__((unavailable("")));

- (void)valueForKey:(NSString *)key inBlock:(SCStyleValueBlock)block;

- (void)boolForKey:(NSString *)key inBlock:(SCStyleBoolBlock)block;
- (void)floatForKey:(NSString *)key inBlock:(SCStyleFloatValue)block;
- (void)integerForKey:(NSString *)key inBlock:(SCStyleIntegerValue)block;

- (void)pointForKey:(NSString *)key inBlock:(SCStylePointValue)block;
- (void)sizeForKey:(NSString *)key inBlock:(SCStyleSizeValue)block;
- (void)rectForKey:(NSString *)key inBlock:(SCStyleRectValue)block;
- (void)edgeInsetsForKey:(NSString *)key inBlock:(SCStyleEdgeInsetsValue)block;

- (void)numberForKey:(NSString *)key inBlock:(SCStyleNumberValue)block
NS_SWIFT_UNAVAILABLE("Use 'integerForKey:inBlock:' or 'floatForKey:inBlock:' instead");

- (void)stringForKey:(NSString *)key inBlock:(SCStyleStringValue)block;
- (void)imageForKey:(NSString *)key inBlock:(SCStyleImageValue)block;
- (void)fontForKey:(NSString *)key inBlock:(SCStyleFontValue)block;
- (void)colorForKey:(NSString *)key inBlock:(SCStyleColorValue)block;

@end
                    
NS_ASSUME_NONNULL_END
