//
//  SCStylesheet.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCStylesheet : NSObject

- (instancetype)initWithStylesheetPath:(NSString *)stylesheetPath
                            withBundle:(NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
