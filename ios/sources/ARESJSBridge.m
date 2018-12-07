//
//  ARESJSBridge.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESJSBridge.h"
#import "ARESJSEnvContext.h"
#import "ARESJSImage.h"
#import "ARESView.h"
#import <objc/runtime.h>

@interface ARESJSBridge ()

@property (nonatomic, strong) JSContext *context;
@property (nonatomic, strong) NSMutableDictionary<NSString *, JSManagedValue *> *animationFrameCallbacks;

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
        _animationFrameCallbacks = [NSMutableDictionary dictionary];
        [self setupEnv];
    }
    return self;
}

- (void)setupEnv {
    objc_setAssociatedObject(self.context,
                             &kContextKey,
                             self,
                             OBJC_ASSOCIATION_ASSIGN);
    self.context[@"Image"] = ^ {
        return [[ARESJSImage alloc] init];
    };
    __weak id welf = self;
    self.context[@"requestAnimationFrame"] = ^ NSString * (JSValue *callback) {
        NSString *handler = [[NSUUID UUID] UUIDString];
        id strongSelf = welf;
        if (strongSelf == nil) {
            return handler;
        }
        [[strongSelf animationFrameCallbacks] setObject:[JSManagedValue managedValueWithValue:callback]
                                                 forKey:handler];
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:strongSelf
                                                                 selector:@selector(onDisplayLink:)];
        displayLink.accessibilityLabel = handler;
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        return handler;
    };
    self.context[@"cancelAnimationFrame"] = ^ (NSString *handler) {
        id strongSelf = welf;
        if (strongSelf == nil) {
            return ;
        }
        if (handler != nil) {
            [[strongSelf animationFrameCallbacks] removeObjectForKey:handler];
        }
    };
}

- (void)onDisplayLink:(CADisplayLink *)sender {
    if (sender.accessibilityLabel != nil &&
        self.animationFrameCallbacks[sender.accessibilityLabel] != nil &&
        self.animationFrameCallbacks[sender.accessibilityLabel].value != nil) {
        [self.animationFrameCallbacks[sender.accessibilityLabel].value callWithArguments:nil];
        [self.view update];
        [self.animationFrameCallbacks removeObjectForKey:sender.accessibilityLabel];
    }
    [sender invalidate];
}

@end
