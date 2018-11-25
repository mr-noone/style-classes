//
//  NSDictionary+Additional.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/25/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<KeyType, ObjectType> (Additional)

- (instancetype)dictionaryByAddingObject:(ObjectType)obj forKey:(KeyType<NSCopying>)key;

@end

NS_ASSUME_NONNULL_END
