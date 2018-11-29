//
//  ARESQuadraticCurveToCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESQuadraticCurveToCommand.h"

@implementation ARESQuadraticCurveToCommand

- (instancetype)initWithCpx:(float)cpx cpy:(float)cpy x:(float)x y:(float)y
{
    self = [super init];
    if (self) {
        _cpx = cpx;
        _cpy = cpy;
        _x = x;
        _y = y;
        [[ARESBeginPathCommand currentPath] addQuadCurveToPoint:CGPointMake(x, y)
                                                   controlPoint:CGPointMake(cpx, cpy)];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextAddQuadCurveToPoint(ctx, self.cpx, self.cpy, self.x, self.y);
}

@end
