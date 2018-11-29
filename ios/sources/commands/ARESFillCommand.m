//
//  ARESFillCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFillCommand.h"

@implementation ARESFillCommand

- (void)draw:(CGContextRef)ctx {
    CGContextFillPath(ctx);
}

@end
