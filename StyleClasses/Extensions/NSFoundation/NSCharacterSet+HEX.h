//
//  NSCharacterSet+HEX.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 17.09.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCharacterSet (HEX)

@property (readonly, class, copy) NSCharacterSet *hexadecimalCharacterSet;

@end
