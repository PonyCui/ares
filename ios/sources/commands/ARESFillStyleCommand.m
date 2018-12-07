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
#import "ARESCreatePatternCommand.h"

@implementation ARESFillStyleCommand

- (instancetype)initWithValue:(id)value
{
    self = [super init];
    if (self) {
        if ([value isKindOfClass:[NSString class]]) {
            _color = [UIColor ares_parseColorWithValue:value];
        }
        else if ([value isKindOfClass:[ARESCreatePatternCommand class]]) {
            _color = [(ARESCreatePatternCommand *)value color];
        }
    }
    return self;
}

- (void)draw:(CGContextRef)ctx view:(ARESView *)view {
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    view.currentState.fillColor = self.color;
}

@end
