//
//  UIWindow+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 09.04.2018.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UIWindow+StyleClasses.h"
#import "NSObject+Runtime.h"

@implementation UIWindow (StyleClasses)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:@selector(becomeKeyWindow)
                         withMethod:@selector(sc_becomeKeyWindow)];
    });
}

- (void)sc_becomeKeyWindow {
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center postNotificationName:SCDidMoveToWindowNotification object:self];
    
    [self sc_becomeKeyWindow];
}

@end
