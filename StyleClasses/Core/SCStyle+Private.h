//
//  SCStyle+Private.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 09.04.2018.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import <StyleClasses/StyleClasses.h>

@interface SCStyle ()

+ (nonnull instancetype)_alloc;
- (nonnull instancetype)initWithStyleClass:(NSString *)styleClass
                       withStyleProperties:(NSDictionary *)styleProperties
                                withBundle:(NSBundle *)bundle;

- (BOOL)isEmpty;

@end
