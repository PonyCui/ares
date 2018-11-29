//
//  ARESClipCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESClipCommand.h"

@implementation ARESClipCommand

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[ARESBeginPathCommand currentPath] addClip];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextClip(ctx);
}

@end
