//
//  ARESStrokeStyleCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESStrokeStyleCommand.h"
#import "ARESView.h"

@implementation ARESStrokeStyleCommand

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
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    view.currentState.strokeColor = self.color;
}

@end
