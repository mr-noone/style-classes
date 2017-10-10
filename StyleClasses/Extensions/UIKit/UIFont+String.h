//
//  UIFont+String.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (String)

/**
 Creates and returns a font object for the specified font name and size.

 @param string A string whose contents are of the form “name, size”,
     where name is the fully specified name of the font and size is
     the size (in points) to which the font is scaled.
 @return A font object of the specified name and size.
 */
+ (nullable instancetype)fontFromString:(nonnull NSString *)string;

@end
