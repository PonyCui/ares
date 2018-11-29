//
//  ARESLineToCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESLineToCommand.h"

@implementation ARESLineToCommand

- (instancetype)initWithX:(CGFloat)x y:(CGFloat)y
{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        [[ARESBeginPathCommand currentPath] addLineToPoint:CGPointMake(x, y)];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextAddLineToPoint(ctx, self.x, self.y);
}

@end
