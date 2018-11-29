//
//  ARESGlobalAlphaCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESGlobalAlphaCommand.h"

@implementation ARESGlobalAlphaCommand

- (instancetype)initWithValue:(CGFloat)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextSetAlpha(ctx, self.value);
}

@end
