//
//  ARESJSEnvContext.h
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ARESJSEnvContextExport <JSExport>

+ (instancetype)create;

@property (nonatomic, strong) NSString *fillStyle;

JSExportAs(fillRect, -(void)fillRect:(float)x y:(float)y w:(float)w h:(float)h);

@end

@interface ARESJSEnvContext : NSObject <ARESJSEnvContextExport>

+ (instancetype)create;

@property (nonatomic, strong) NSString *fillStyle;

- (void)fillRect:(float)x y:(float)y w:(float)w h:(float)h;

@end

NS_ASSUME_NONNULL_END
