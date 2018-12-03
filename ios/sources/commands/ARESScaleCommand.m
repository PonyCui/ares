//
//  ARESScaleCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESScaleCommand.h"

@implementation ARESScaleCommand

- (instancetype)initWithSx:(CGFloat)sx sy:(CGFloat)sy
{
    self = [super init];
    if (self) {
        _sx = sx;
        _sy = sy;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextScaleCTM(ctx, self.sx, self.sy);
}

@end
