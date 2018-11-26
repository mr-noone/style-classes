//
//  UINavigationItem+StyleClasses.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/25/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCStyleClass.h"

@interface UINavigationItem (StyleClasses) <SCStyleClass>

@property (copy, nonatomic, nullable) IBInspectable NSString *styleClass;

@end
