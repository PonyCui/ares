//
//  ARESFillStyleCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFillStyleCommand.h"
#import "ARESView.h"

@implementation ARESFillStyleCommand

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        [self parseStaticColor:value];
    }
    return self;
}

- (void)parseStaticColor:(NSString *)value {
    if ([value isEqualToString:@"red"]) {
        self.color = [UIColor redColor];
    }
    else if ([value isEqualToString:@"yellow"]) {
        self.color = [UIColor yellowColor];
    }
}

- (void)draw:(CGContextRef)ctx view:(ARESView *)view {
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    view.currentState.fillColor = self.color;
}

@end
