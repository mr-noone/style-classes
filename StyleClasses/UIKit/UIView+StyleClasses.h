//
//  UIView+StyleClasses.h
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 16.10.17.
//  Copyright © 2017 Aleksey Zgurskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCStyleClass.h"

@interface UIView (StyleClasses) <SCStyleClass>

@property (copy, nonatomic, nullable) IBInspectable NSString *styleClass;

@end
