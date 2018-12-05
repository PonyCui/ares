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
@property (nonatomic, strong) NSMutableArray<ARESState *> *states;
@property (nonatomic, assign) CGContextRef cgContext;

@end

@implementation ARESView

- (void)dealloc {
    [self releaseCGContext];
}

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
    self.states = [NSMutableArray array];
    [self resetCGContext];
}

- (ARESHandler *)exec:(ARESScript *)script {
    ARESHandler *handler = [[ARESHandler alloc] init];
    [self.context evaluateScript:@"if (typeof main === 'undefined') { var main = undefined; } else { main = undefined; }"];
    [self.context evaluateScript:script.evalScript];
    JSValue *value = [[self.context objectForKeyedSubscript:@"main"]
                      callWithArguments:@[
                                          [[ARESJSEnvContext alloc] init]
                                          ]];
    [self update];
    handler.managedValue = [JSManagedValue managedValueWithValue:value];
    handler.view = self;
    return handler;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self resetCGContext];
}

- (void)resetCGContext {
    if (self.bounds.size.width == 0 || self.bounds.size.height == 0) {
        [self releaseCGContext];
        return;
    }
    CGContextRef oldContext = self.cgContext;
    if (oldContext != NULL &&
        CGBitmapContextGetWidth(oldContext) == self.bounds.size.width &&
        CGBitmapContextGetHeight(oldContext) == self.bounds.size.height) {
        return;
    }
    CGImageRef oldImage = oldContext != NULL ? CGBitmapContextCreateImage(oldContext) : NULL;
    self.cgContext = CGBitmapContextCreate(NULL,
                                           self.bounds.size.width,
                                           self.bounds.size.height,
                                           8,
                                           self.bounds.size.width * 4,
                                           CGColorSpaceCreateDeviceRGB(),
                                           kCGImageAlphaPremultipliedLast);
    [self.states removeAllObjects];
    [self.states addObject:[[ARESState alloc] init]];
    CGContextSetTextMatrix(self.cgContext, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    if (oldImage != NULL) {
        CGContextDrawImage(self.cgContext,
                           CGRectMake(0, 0, CGImageGetWidth(oldImage), CGImageGetHeight(oldImage)),
                           oldImage);
        CGImageRelease(oldImage);
    }
    if (oldContext != NULL) {
        CGContextRelease(oldContext);
    }
    [self update];
}

- (void)releaseCGContext {
    if (self.cgContext != NULL) {
        CGContextRelease(self.cgContext);
        self.cgContext = NULL;
    }
}

- (void)addCommand:(ARESCommand *)command {
    [self.commands addObject:command];
}

- (void)drawCommands {
    if (self.cgContext != NULL) {
        for (ARESCommand *command in self.commands) {
            [command draw:self.cgContext view:self];
            [command draw:self.cgContext];
        }
        [self.commands removeAllObjects];
    }
}

- (void)update {
    [self drawCommands];
    if (self.cgContext != NULL) {
        self.layer.contents = CFBridgingRelease(CGBitmapContextCreateImage(self.cgContext));
        self.layer.transform = CATransform3DMakeAffineTransform(CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    }
}

- (void)save {
    if (self.cgContext != NULL) {
        CGContextSaveGState(self.cgContext);
        if (self.states.lastObject != nil) {
            [self.states addObject:[self.states.lastObject clone]];
        }
    }
}

- (void)restore {
    if (self.cgContext != NULL) {
        CGContextRestoreGState(self.cgContext);
        [self.states removeLastObject];
    }
}

- (ARESState *)currentState {
    return self.states.lastObject;
}

@end
