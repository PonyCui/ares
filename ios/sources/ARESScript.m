//
//  ARESScript.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESScript.h"

@interface ARESScript ()

@property (nonatomic, readwrite) NSString *evalScript;

@end

@implementation ARESScript

+ (ARESScript *)decodeFromBundle:(NSString *)named bundle:(NSBundle *)bundle {
    NSString *path = [(bundle ?: [NSBundle mainBundle]) pathForResource:named ofType:nil];
    if (path == nil) {
        return nil;
    }
    NSString *evalScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (evalScript == nil) {
        return nil;
    }
    return [[ARESScript alloc] initWithEvalScript:evalScript];
}

- (instancetype)initWithEvalScript:(NSString *)evalScript
{
    self = [super init];
    if (self) {
        _evalScript = evalScript;
    }
    return self;
}

@end
