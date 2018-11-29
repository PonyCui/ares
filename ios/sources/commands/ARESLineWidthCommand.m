//
//  ARESLineWidthCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESLineWidthCommand.h"

@implementation ARESLineWidthCommand

- (instancetype)initWithLineWidth:(CGFloat)lineWidth {
    self = [super init];
    if (self) {
        _lineWidth = lineWidth;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, self.lineWidth);
}

@end
