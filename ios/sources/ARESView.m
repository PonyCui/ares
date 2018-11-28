//
//  ARESView.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESView.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ARESCommand.h"
#import "ARESJSBridge.h"
#import "ARESJSEnvContext.h"

@interface ARESView ()

@property (nonatomic, strong) JSContext *context;
@property (nonatomic, strong) ARESJSBridge *bridge;
@property (nonatomic, strong) NSMutableArray<ARESCommand *> *commands;

@end

@implementation ARESView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self doInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self doInit];
    }
    return self;
}

- (void)doInit {
    self.backgroundColor = [UIColor clearColor];
    self.context = [[JSContext alloc] init];
    self.bridge = [[ARESJSBridge alloc] initWithContext:self.context];
    self.bridge.view = self;
    self.commands = [NSMutableArray array];
}

- (ARESHandler *)exec:(ARESScript *)script {
    ARESHandler *handler = [[ARESHandler alloc] init];
    [self.context evaluateScript:@"if (typeof main === 'undefined') { var main = undefined; } else { main = undefined; }"];
    [self.context evaluateScript:script.evalScript];
    JSValue *value = [[self.context objectForKeyedSubscript:@"main"]
                      callWithArguments:@[
                                          [[ARESJSEnvContext alloc] init]
                                          ]];
    handler.managedValue = [JSManagedValue managedValueWithValue:value];
    return handler;
}

- (void)addCommand:(ARESCommand *)command {
    [self.commands addObject:command];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    for (ARESCommand *command in self.commands) {
        [command draw];
    }
}

@end
