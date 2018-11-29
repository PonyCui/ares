//
//  ARESClosePathCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESClosePathCommand.h"

@implementation ARESClosePathCommand

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[ARESBeginPathCommand currentPath] closePath];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextClosePath(ctx);
}

@end
