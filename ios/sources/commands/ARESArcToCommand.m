//
//  ARESArcToCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESArcToCommand.h"

@implementation ARESArcToCommand

- (instancetype)initWithX1:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 radius:(float)radius
{
    self = [super init];
    if (self) {
        _x1 = x1;
        _y1 = y1;
        _x2 = x2;
        _y2 = y2;
        _radius = radius;
        CGPathRef pathRef = [ARESBeginPathCommand currentPath].CGPath;
        CGMutablePathRef mutablePath = CGPathCreateMutableCopyByTransformingPath(pathRef, NULL);
        CGPathAddArcToPoint(mutablePath, NULL, x1, y1, x2, y2, radius);
        [[ARESBeginPathCommand currentPath] setCGPath:mutablePath];
        CGPathRelease(mutablePath);
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextAddArcToPoint(ctx, self.x1, self.y1, self.x2, self.y2, self.radius);
}

@end
