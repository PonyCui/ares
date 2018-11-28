//
//  ARESFillStyleCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFillStyleCommand.h"

@interface ARESFillStyleCommand ()

@property (nonatomic, readwrite) UIColor *color;

@end

@implementation ARESFillStyleCommand

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

- (void)draw {
    [self.color setFill];
}

@end
