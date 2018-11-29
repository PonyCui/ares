//
//  ARESStrokeStyleCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESStrokeStyleCommand.h"

@interface ARESStrokeStyleCommand ()

@property (nonatomic, readwrite) UIColor *color;

@end

@implementation ARESStrokeStyleCommand

- (instancetype)initWithMethod:(NSString *)method arguments:(NSArray *)arguments {
    self = [super initWithMethod:method arguments:arguments];
    if (self) {
        if (arguments.count == 1 && [arguments[0] isKindOfClass:[NSString class]]) {
            [self parseStaticColor:arguments[0]];
        }
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
    [self.color setStroke];
}

@end
