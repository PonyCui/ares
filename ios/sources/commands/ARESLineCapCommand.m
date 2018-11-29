//
//  ARESLineCapCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESLineCapCommand.h"

@implementation ARESLineCapCommand

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    if ([self.value isEqualToString:@"butt"]) {
        CGContextSetLineCap(ctx, kCGLineCapButt);
    }
    else if ([self.value isEqualToString:@"round"]) {
        CGContextSetLineCap(ctx, kCGLineCapRound);
    }
    else if ([self.value isEqualToString:@"square"]) {
        CGContextSetLineCap(ctx, kCGLineCapSquare);
    }
}

@end
