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

@property (nonatomic, assign) float globalAlpha;
@property (nonatomic, strong) NSString *fillStyle;
@property (nonatomic, strong) NSString *strokeStyle;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, strong) NSString *lineCap;
@property (nonatomic, strong) NSString *lineJoin;
@property (nonatomic, assign) float miterLimit;

JSExportAs(fillRect, -(void)fillRect:(float)x y:(float)y w:(float)w h:(float)h);
JSExportAs(strokeRect, -(void)strokeRect:(float)x y:(float)y w:(float)w h:(float)h);
JSExportAs(clearRect, -(void)clearRect:(float)x y:(float)y w:(float)w h:(float)h);
- (void)beginPath;
- (void)closePath;
- (void)stroke;
- (void)fill;
JSExportAs(lineTo, -(void)lineTo:(float)x y:(float)y);
JSExportAs(moveTo, -(void)moveTo:(float)x y:(float)y);
JSExportAs(rect, -(void)rect:(float)x y:(float)y w:(float)w h:(float)h);
JSExportAs(quadraticCurveTo, -(void)quadraticCurveTo:(float)cpx cpy:(float)cpy x:(float)x y:(float)y);
JSExportAs(bezierCurveTo, -(void)bezierCurveTo:(float)cp1x cp1y:(float)cp1y cp2x:(float)cp2x cp2y:(float)cp2y x:(float)x y:(float)y);
JSExportAs(arc, -(void)arc:(float)x y:(float)y r:(float)r start:(float)start end:(float)end anticlockwise:(BOOL)anticlockwise);
JSExportAs(arcTo, -(void)arcTo:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 radius:(float)radius);
- (void)clip;
JSExportAs(isPointInPath, -(BOOL)isPointInPath:(float)x y:(float)y);

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
- (void)beginPath;
- (void)closePath;
- (void)stroke;
- (void)fill;
- (void)lineTo:(float)x y:(float)y;
- (void)moveTo:(float)x y:(float)y;
- (void)rect:(float)x y:(float)y w:(float)w h:(float)h;
- (void)quadraticCurveTo:(float)cpx cpy:(float)cpy x:(float)x y:(float)y;
- (void)bezierCurveTo:(float)cp1x cp1y:(float)cp1y cp2x:(float)cp2x cp2y:(float)cp2y x:(float)x y:(float)y;
- (void)arc:(float)x y:(float)y r:(float)r start:(float)start end:(float)end anticlockwise:(BOOL)anticlockwise;
- (void)arcTo:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 radius:(float)radius;
- (void)clip;
- (BOOL)isPointInPath:(float)x y:(float)y;


@end

NS_ASSUME_NONNULL_END
