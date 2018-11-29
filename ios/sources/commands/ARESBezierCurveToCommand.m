//
//  ARESBezierCurveToCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESBezierCurveToCommand.h"

@implementation ARESBezierCurveToCommand

- (instancetype)initWithCp1x:(float)cp1x
                        cp1y:(float)cp1y
                        cp2x:(float)cp2x
                        cp2y:(float)cp2y
                           x:(float)x
                           y:(float)y
{
    self = [super init];
    if (self) {
        _cp1x = cp1x;
        _cp1y = cp1y;
        _cp2x = cp2x;
        _cp2y = cp2y;
        _x = x;
        _y = y;
        [[ARESBeginPathCommand currentPath] addCurveToPoint:CGPointMake(x, y)
                                              controlPoint1:CGPointMake(cp1x, cp1y)
                                              controlPoint2:CGPointMake(cp2x, cp2y)];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextAddCurveToPoint(ctx, self.cp1x, self.cp1y, self.cp2x, self.cp2y, self.x, self.y);
}

@end
