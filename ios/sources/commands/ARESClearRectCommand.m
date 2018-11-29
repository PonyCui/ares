//
//  ARESClearRectCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESClearRectCommand.h"

@interface ARESClearRectCommand ()

@property (nonatomic, assign) CGRect rect;

@end

@implementation ARESClearRectCommand

- (instancetype)initWithX:(float)x y:(float)y w:(float)w h:(float)h
{
    self = [super init];
    if (self) {
        _rect = CGRectMake(x, y, w, h);
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextClearRect(ctx, self.rect);
}

@end
