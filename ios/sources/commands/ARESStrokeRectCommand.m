//
//  ARESStrokeRectCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESStrokeRectCommand.h"

@interface ARESStrokeRectCommand ()

@property (nonatomic, strong) UIBezierPath *bezierPath;

@end

@implementation ARESStrokeRectCommand

- (instancetype)initWithX:(float)x y:(float)y w:(float)w h:(float)h
{
    self = [super init];
    if (self) {
        _bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextAddPath(ctx, self.bezierPath.CGPath);
    CGContextStrokePath(ctx);
}

@end
