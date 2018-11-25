//
//  NSDictionary+Additional.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/25/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "NSDictionary+Additional.h"

@implementation NSDictionary (Additional)

- (instancetype)dictionaryByAddingObject:(id)obj forKey:(id<NSCopying>)key {
  NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self];
  [dict setObject:obj forKey:key];
  return [NSDictionary dictionaryWithDictionary:dict];
}

@end
