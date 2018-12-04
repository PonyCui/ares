//
//  ARESShadowCommand.m
//  ares
//
//  Created by PonyCui on 2018/12/4.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESShadowCommand.h"

@implementation ARESShadowCommand

- (instancetype)initWithX:(CGFloat)x y:(CGFloat)y blur:(CGFloat)blur colorString:(NSString *)colorString
{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _blur = blur;
        [self parseStaticColor:colorString];
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

- (void)draw:(CGContextRef)ctx {
    CGContextSetShadowWithColor(ctx, CGSizeMake(self.x, self.y), self.blur, self.color.CGColor);
}

@end
