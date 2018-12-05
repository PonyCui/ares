//
//  ARESRotateCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESRotateCommand.h"

@implementation ARESRotateCommand

- (instancetype)initWithAngle:(CGFloat)angle
{
    self = [super init];
    if (self) {
        _angle = angle;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextRotateCTM(ctx, self.angle);
}

@end
