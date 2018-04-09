//
//  NSObject+Runtime.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 16.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

+ (void)swizzleClassMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;
+ (void)swizzleInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

@end
