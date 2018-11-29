//
//  ARESArcCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESArcCommand.h"

@implementation ARESArcCommand

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                        r:(CGFloat)r
                    start:(CGFloat)start
                      end:(CGFloat)end
            anticlockwise:(BOOL)anticlockwise
{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _r = r;
        _start = start;
        _end = end;
        _anticlockwise = anticlockwise;
        [[ARESBeginPathCommand currentPath]
         addArcWithCenter:CGPointMake(x, y)
         radius:r
         startAngle:start
         endAngle:end
         clockwise:!anticlockwise];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextAddArc(ctx, self.x, self.y, self.r, self.start, self.end, self.anticlockwise ? 1 : 0);
}

@end
