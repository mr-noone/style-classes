//
//  NSMutableDictionary+Additional.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 10.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import "NSMutableDictionary+Additional.h"

@implementation NSMutableDictionary (Additional)

- (void)setObjectsFromDictionary:(NSDictionary *)dictionary {
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [self setObject:obj forKey:key];
    }];
}

@end
