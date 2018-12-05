//
//  ARESFillCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFillCommand.h"
#import "ARESGlobalCompositeOperationCommand.h"

@implementation ARESFillCommand

- (void)draw:(CGContextRef)ctx {
    CGContextFillPath(ctx);
    if ([ARESGlobalCompositeOperationCommand shouldEndTrasparencyLayer]) {
        CGContextEndTransparencyLayer(ctx);
        [ARESGlobalCompositeOperationCommand setEndedTrasparencyLayer];
    }
}

@end
