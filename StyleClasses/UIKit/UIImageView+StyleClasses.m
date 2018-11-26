//
//  UIImageView+StyleClasses.m
//  StyleClasses
//
//  Created by Aleksey Zgurskiy on 11/26/18.
//  Copyright © 2018 Aleksey Zgurskiy. All rights reserved.
//

#import "UIImageView+StyleClasses.h"
#import "UIView+StyleClasses.h"
#import "SCStyleClass.h"
#import "SCStyle.h"

@implementation UIImageView (StyleClasses)

- (void)updateWithStyle:(SCStyle *)style {
  [super updateWithStyle:style];
  
  [style imageForKey:@"image" inBlock:^(UIImage * _Nonnull value) {
    self.image = value;
  }];
}

@end
