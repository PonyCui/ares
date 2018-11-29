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

@property (nonatomic, assign) float globalAlpha;
@property (nonatomic, strong) NSString *fillStyle;
@property (nonatomic, strong) NSString *strokeStyle;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, strong) NSString *lineCap;
@property (nonatomic, strong) NSString *lineJoin;
@property (nonatomic, assign) float miterLimit;

JSExportAs(fillRect, -(void)fillRect:(float)x y:(float)y w:(float)w h:(float)h);
JSExportAs(strokeRect, - (void)strokeRect:(float)x y:(float)y w:(float)w h:(float)h);
JSExportAs(clearRect, - (void)clearRect:(float)x y:(float)y w:(float)w h:(float)h);

@end

@interface ARESJSEnvContext : NSObject <ARESJSEnvContextExport>

+ (instancetype)create;

@property (nonatomic, assign) float globalAlpha;
@property (nonatomic, strong) NSString *fillStyle;
@property (nonatomic, strong) NSString *strokeStyle;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, strong) NSString *lineCap;
@property (nonatomic, strong) NSString *lineJoin;
@property (nonatomic, assign) float miterLimit;

- (void)fillRect:(float)x y:(float)y w:(float)w h:(float)h;
- (void)strokeRect:(float)x y:(float)y w:(float)w h:(float)h;
- (void)clearRect:(float)x y:(float)y w:(float)w h:(float)h;

@end

NS_ASSUME_NONNULL_END
