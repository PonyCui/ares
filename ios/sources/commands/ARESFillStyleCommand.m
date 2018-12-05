//
//  ARESFillStyleCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFillStyleCommand.h"
#import "UIColor+ARESParser.h"

@implementation ARESFillStyleCommand

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        _color = [UIColor parseColorWithValue:value];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
}

@end
