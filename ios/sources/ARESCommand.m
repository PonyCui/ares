//
//  ARESCommand.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

@interface ARESCommand ()

@property (nonatomic, readwrite) NSString *method;
@property (nonatomic, readwrite) NSArray *arguments;

@end

@implementation ARESCommand

- (instancetype)initWithMethod:(NSString *)method arguments:(NSArray *)arguments
{
    self = [super init];
    if (self) {
        _method = method;
        _arguments = arguments;
    }
    return self;
}

- (void)draw {}

@end
