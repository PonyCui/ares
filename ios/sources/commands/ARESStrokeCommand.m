//
//  ARESStrokeCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESStrokeCommand.h"

@implementation ARESStrokeCommand

- (void)draw:(CGContextRef)ctx {
    CGContextStrokePath(ctx);
}

@end
