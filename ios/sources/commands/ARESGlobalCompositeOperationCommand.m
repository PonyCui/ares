//
//  ARESGlobalCompositeOperationCommand.m
//  ares
//
//  Created by PonyCui on 2018/12/4.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESGlobalCompositeOperationCommand.h"

@implementation ARESGlobalCompositeOperationCommand

static BOOL inTrasparencyLayer = NO;

+ (BOOL)shouldEndTrasparencyLayer {
    return inTrasparencyLayer;
}

+ (void)setEndedTrasparencyLayer {
    inTrasparencyLayer = NO;
}

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    if ([self.value isEqualToString:@"source-over"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeNormal);
    }
    else if ([self.value isEqualToString:@"source-atop"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeSourceAtop);
    }
    else if ([self.value isEqualToString:@"source-in"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeSourceIn);
        CGContextBeginTransparencyLayer(ctx, NULL);
        inTrasparencyLayer = YES;
    }
    else if ([self.value isEqualToString:@"source-out"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(ctx, NULL);
        inTrasparencyLayer = YES;
    }
    else if ([self.value isEqualToString:@"destination-over"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeDestinationOver);
    }
    else if ([self.value isEqualToString:@"destination-atop"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeDestinationAtop);
        CGContextBeginTransparencyLayer(ctx, NULL);
        inTrasparencyLayer = YES;
    }
    else if ([self.value isEqualToString:@"destination-in"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeDestinationIn);
        CGContextBeginTransparencyLayer(ctx, NULL);
        inTrasparencyLayer = YES;
    }
    else if ([self.value isEqualToString:@"destination-out"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeDestinationOut);
    }
    else if ([self.value isEqualToString:@"lighter"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeLighten);
    }
    else if ([self.value isEqualToString:@"darker"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeDarken);
    }
    else if ([self.value isEqualToString:@"xor"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeXOR);
    }
    else if ([self.value isEqualToString:@"copy"]) {
        CGContextSetBlendMode(ctx, kCGBlendModeCopy);
        CGContextBeginTransparencyLayer(ctx, NULL);
        inTrasparencyLayer = YES;
    }
}

@end
