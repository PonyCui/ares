//
//  ARESBeginPathCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESBeginPathCommand.h"

@implementation ARESBeginPathCommand

+ (UIBezierPath *)currentPath {
    static UIBezierPath *sharedPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPath = [UIBezierPath bezierPath];
    });
    return sharedPath;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[ARESBeginPathCommand currentPath] removeAllPoints];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextBeginPath(ctx);
}

@end
