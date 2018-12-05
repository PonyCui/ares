//
//  ARESStrokeStyleCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESStrokeStyleCommand.h"
#import "UIColor+ARESParser.h"

@implementation ARESStrokeStyleCommand

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        _color = [UIColor parseColorWithValue:value];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
}

@end
