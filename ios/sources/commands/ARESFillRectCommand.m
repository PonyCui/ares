//
//  ARESFillRectCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFillRectCommand.h"

@interface ARESFillRectCommand ()

@property (nonatomic, strong) UIBezierPath *bezierPath;

@end

@implementation ARESFillRectCommand

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
    CGContextFillPath(ctx);
}

@end
