//
//  ARESJSEnvContext.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESJSEnvContext.h"
#import "ARESJSBridge.h"
#import "ARESView.h"
#import "ARESGlobalAlphaCommand.h"
#import "ARESFillStyleCommand.h"
#import "ARESStrokeStyleCommand.h"
#import "ARESLineWidthCommand.h"
#import "ARESLineCapCommand.h"
#import "ARESLineJoinCommand.h"
#import "ARESMiterLimitCommand.h"
#import "ARESFillRectCommand.h"
#import "ARESStrokeRectCommand.h"
#import "ARESClearRectCommand.h"

@implementation ARESJSEnvContext

+ (instancetype)create {
    return [ARESJSEnvContext new];
}

- (void)setGlobalAlpha:(float)globalAlpha {
    _globalAlpha = globalAlpha;
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESGlobalAlphaCommand alloc] initWithValue:globalAlpha]];
    }
}

- (void)setFillStyle:(NSString *)fillStyle {
    _fillStyle = fillStyle;
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESFillStyleCommand alloc] initWithValue:fillStyle]];
    }
}

- (void)setStrokeStyle:(NSString *)strokeStyle {
    _strokeStyle = strokeStyle;
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESStrokeStyleCommand alloc] initWithValue:strokeStyle]];
    }
}

- (void)setLineWidth:(float)lineWidth {
    _lineWidth = lineWidth;
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESLineWidthCommand alloc] initWithLineWidth:lineWidth]];
    }
}

- (void)setLineCap:(NSString *)lineCap {
    _lineCap = lineCap;
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESLineCapCommand alloc] initWithValue:lineCap]];
    }
}

- (void)setLineJoin:(NSString *)lineJoin {
    _lineJoin = lineJoin;
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESLineJoinCommand alloc] initWithValue:lineJoin]];
    }
}

- (void)setMiterLimit:(float)miterLimit {
    _miterLimit = miterLimit;
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESMiterLimitCommand alloc] initWithValue:miterLimit]];
    }
}

- (void)fillRect:(float)x y:(float)y w:(float)w h:(float)h {
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESFillRectCommand alloc]
                          initWithX:x
                          y:y
                          w:w
                          h:h]];
    }
}

- (void)strokeRect:(float)x y:(float)y w:(float)w h:(float)h {
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESStrokeRectCommand alloc]
                          initWithX:x
                          y:y
                          w:w
                          h:h]];
    }
}

- (void)clearRect:(float)x y:(float)y w:(float)w h:(float)h {
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:[[ARESClearRectCommand alloc]
                          initWithX:x
                          y:y
                          w:w
                          h:h]];
    }
}

@end
