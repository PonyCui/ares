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
#import "ARESFillStyleCommand.h"
#import "ARESFillRectCommand.h"

@implementation ARESJSEnvContext

+ (instancetype)create {
    return [ARESJSEnvContext new];
}

- (void)setFillStyle:(NSString *)fillStyle {
    _fillStyle = fillStyle;
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        
        [view addCommand:[[ARESFillStyleCommand alloc] initWithMethod:@"fillStyle"
                                                            arguments:@[fillStyle ?: @""]]];
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


@end
