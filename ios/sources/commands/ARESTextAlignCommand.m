//
//  ARESTextAlignCommand.m
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESTextAlignCommand.h"

@implementation ARESTextAlignCommand

static NSString *currentValue;

+ (NSString *)currentValue {
    return currentValue;
}

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    currentValue = self.value;
}

@end
