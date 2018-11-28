//
//  ARESJSBridge.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESJSBridge.h"
#import "ARESJSEnvContext.h"
#import <objc/runtime.h>

@interface ARESJSBridge ()

@property (nonatomic, strong) JSContext *context;

@end

@implementation ARESJSBridge

static int kContextKey;

+ (ARESView *)viewWithContext:(JSContext *)context {
    return [objc_getAssociatedObject(context, &kContextKey) view];
}

- (instancetype)initWithContext:(JSContext *)context
{
    self = [super init];
    if (self) {
        _context = context;
        [self setupEnv];
    }
    return self;
}

- (void)setupEnv {
    objc_setAssociatedObject(self.context,
                             &kContextKey,
                             self,
                             OBJC_ASSOCIATION_ASSIGN);
}

@end
