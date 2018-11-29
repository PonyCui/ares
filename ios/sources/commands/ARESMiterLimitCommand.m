//
//  ARESMiterLimitCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESMiterLimitCommand.h"

@implementation ARESMiterLimitCommand

- (instancetype)initWithValue:(CGFloat)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextSetMiterLimit(ctx, self.value);
}

@end
