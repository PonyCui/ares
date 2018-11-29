//
//  ARESLineJoinCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESLineJoinCommand.h"

@implementation ARESLineJoinCommand

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    if ([self.value isEqualToString:@"bevel"]) {
        CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    }
    else if ([self.value isEqualToString:@"miter"]) {
        CGContextSetLineJoin(ctx, kCGLineJoinMiter);
    }
    else if ([self.value isEqualToString:@"round"]) {
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
    }
}

@end
