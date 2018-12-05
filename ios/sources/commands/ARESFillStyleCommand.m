//
//  ARESFillStyleCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFillStyleCommand.h"
#import "UIColor+ARESParser.h"
#import "ARESView.h"

@implementation ARESFillStyleCommand

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        _color = [UIColor ares_parseColorWithValue:value];
    }
    return self;
}

- (void)draw:(CGContextRef)ctx view:(ARESView *)view {
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    view.currentState.fillColor = self.color;
}

@end
