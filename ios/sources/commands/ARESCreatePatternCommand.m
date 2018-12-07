//
//  ARESCreatePatternCommand.m
//  ares
//
//  Created by PonyCui on 2018/12/7.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCreatePatternCommand.h"
#import "ARESJSImage.h"

@implementation ARESCreatePatternCommand

- (instancetype)initWithImage:(ARESJSImage *)image repetition:(NSString *)repetition
{
    self = [super init];
    if (self) {
        _image = image;
        _repetition = repetition;
    }
    return self;
}

- (UIColor *)color {
    return [UIColor colorWithPatternImage:self.image.image];
}

@end
