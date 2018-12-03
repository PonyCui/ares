//
//  ARESSaveCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESSaveCommand.h"
#import "ARESView.h"

@implementation ARESSaveCommand

- (void)draw:(CGContextRef)ctx view:(ARESView *)view {
    [view save];
}

@end
