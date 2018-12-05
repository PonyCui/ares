//
//  ARESRestoreCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESRestoreCommand.h"
#import "ARESView.h"

@implementation ARESRestoreCommand

- (void)draw:(CGContextRef)ctx view:(ARESView *)view {
    [view restore];
}

@end
