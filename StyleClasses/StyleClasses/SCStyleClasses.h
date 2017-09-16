//
//  SCStyleClasses.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 10.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCStyleClasses : NSObject

+ (nonnull instancetype)new __attribute__((unavailable("use 'instance' instead")));
+ (nonnull instancetype)alloc __attribute__((unavailable("use 'instance' instead")));
- (nonnull instancetype)init __attribute__((unavailable("use 'instance' instead")));

@property (nonatomic, class, readonly, nonnull) SCStyleClasses *instance;

- (void)configureWithStylesheetName:(nonnull NSString *)stylesheetName;

@end
