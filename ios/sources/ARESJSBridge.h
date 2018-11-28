//
//  ARESJSBridge.h
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

@class ARESView;

@interface ARESJSBridge : NSObject

@property (nonatomic, weak) ARESView *view;

+ (nullable ARESView *)viewWithContext:(nonnull JSContext *)context;

- (instancetype)initWithContext:(nonnull JSContext *)context;

@end

NS_ASSUME_NONNULL_END
