//
//  ARESTranslateCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESTranslateCommand.h"

@implementation ARESTranslateCommand

- (instancetype)initWithTx:(CGFloat)tx ty:(CGFloat)ty
{
    self = [super init];
    if (self) {
        _tx = tx;
        _ty = ty;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextTranslateCTM(ctx, self.tx, self.ty);
}

@end
