//
//  ARESRectCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESRectCommand.h"

@implementation ARESRectCommand

- (instancetype)initWithX:(float)x y:(float)y w:(float)w h:(float)h
{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _w = w;
        _h = h;
        [[ARESBeginPathCommand currentPath]
         appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)]];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextAddRect(ctx, CGRectMake(self.x, self.y, self.w, self.h));
}

@end
