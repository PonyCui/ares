//
//  ARESLineWidthCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESLineWidthCommand.h"

@interface ARESLineWidthCommand ()

@property (nonatomic, readwrite) CGFloat lineWidth;

@end

@implementation ARESLineWidthCommand

- (instancetype)initWithMethod:(NSString *)method arguments:(NSArray *)arguments {
    self = [super initWithMethod:method arguments:arguments];
    if (self) {
        if (arguments.count == 1 && [arguments[0] isKindOfClass:[NSNumber class]]) {
            _lineWidth = [arguments[0] floatValue];
        }
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, self.lineWidth);
}

@end
