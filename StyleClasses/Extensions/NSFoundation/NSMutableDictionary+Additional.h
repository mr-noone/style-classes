//
//  NSMutableDictionary+Additional.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 10.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary<KeyType, ObjectType> (Additional)

- (void)setObjectsFromDictionary:(NSDictionary<KeyType, ObjectType> *)dictionary;

@end
