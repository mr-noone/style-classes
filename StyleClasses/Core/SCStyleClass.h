//
//  SCStyleClass.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 09.04.2018.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCStyle;

@protocol SCStyleClass

@property (copy, nonatomic, nullable) IBInspectable NSString *styleClass;

- (void)setNeedsUpdateStyle;
- (void)updateWithStyle:(nonnull SCStyle *)style;

@end
