//
//  ARESSetTransformCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESSetTransformCommand.h"

@implementation ARESSetTransformCommand

- (instancetype)initWithA:(CGFloat)a b:(CGFloat)b c:(CGFloat)c d:(CGFloat)d tx:(CGFloat)tx ty:(CGFloat)ty
{
    self = [super init];
    if (self) {
        _a = a;
        _b = b;
        _c = c;
        _d = d;
        _tx = tx;
        _ty = ty;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextConcatCTM(ctx, CGAffineTransformInvert(CGContextGetCTM(ctx)));
    CGContextConcatCTM(ctx, CGAffineTransformMake(self.a, self.b, self.c, self.d, self.tx, self.ty));
}

@end
