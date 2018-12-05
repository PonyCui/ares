//
//  ARESState.m
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESState.h"

@implementation ARESState

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fillColor = [UIColor blackColor];
        _strokeColor = [UIColor blackColor];
        _lineWidth = 1;
    }
    return self;
}

- (ARESState *)clone {
    ARESState *newValue = [[ARESState alloc] init];
    newValue.fillColor = self.fillColor;
    newValue.strokeColor = self.strokeColor;
    newValue.lineWidth = self.lineWidth;
    return newValue;
}

@end
