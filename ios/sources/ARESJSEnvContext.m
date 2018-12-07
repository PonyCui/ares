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
#import "ARESSaveCommand.h"
#import "ARESRestoreCommand.h"
#import "ARESScaleCommand.h"
#import "ARESRotateCommand.h"
#import "ARESTranslateCommand.h"
#import "ARESTransformCommand.h"
#import "ARESSetTransformCommand.h"
#import "ARESGlobalAlphaCommand.h"
#import "ARESGlobalCompositeOperationCommand.h"
#import "ARESFillStyleCommand.h"
#import "ARESStrokeStyleCommand.h"
#import "ARESLineWidthCommand.h"
#import "ARESLineCapCommand.h"
#import "ARESLineJoinCommand.h"
#import "ARESMiterLimitCommand.h"
#import "ARESShadowCommand.h"
#import "ARESFillRectCommand.h"
#import "ARESStrokeRectCommand.h"
#import "ARESClearRectCommand.h"
#import "ARESBeginPathCommand.h"
#import "ARESClosePathCommand.h"
#import "ARESStrokeCommand.h"
#import "ARESFillCommand.h"
#import "ARESLineToCommand.h"
#import "ARESMoveToCommand.h"
#import "ARESRectCommand.h"
#import "ARESQuadraticCurveToCommand.h"
#import "ARESBezierCurveToCommand.h"
#import "ARESArcCommand.h"
#import "ARESArcToCommand.h"
#import "ARESClipCommand.h"
#import "ARESFontCommand.h"
#import "ARESTextAlignCommand.h"
#import "ARESTextBaselineCommand.h"
#import "ARESFillTextCommand.h"
#import "ARESStrokeTextCommand.h"
#import "ARESMeasureTextCommand.h"
#import "ARESDrawImageCommand.h"
#import "ARESJSImage.h"

@implementation ARESJSEnvContext

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lineWidth = 1.0;
        _font = @"10px sans-serif";
    }
    return self;
}

- (NSDictionary *)canvas {
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    return @{
             @"width": @(view.bounds.size.width),
             @"height": @(view.bounds.size.height),
             @"getContext": ^ {
                 return self;
             },
             };
}

- (void)save {
    [self addCommandToView:[[ARESSaveCommand alloc] init]];
}

- (void)restore {
    [self addCommandToView:[[ARESRestoreCommand alloc] init]];
}

- (void)scale:(float)x y:(float)y {
    [self addCommandToView:[[ARESScaleCommand alloc] initWithSx:x sy:y]];
}

- (void)rotate:(float)angle {
    [self addCommandToView:[[ARESRotateCommand alloc] initWithAngle:angle]];
}

- (void)translate:(float)x y:(float)y {
    [self addCommandToView:[[ARESTranslateCommand alloc] initWithTx:x ty:y]];
}

- (void)transform:(float)a b:(float)b c:(float)c d:(float)d tx:(float)tx ty:(float)ty {
    [self addCommandToView:[[ARESTransformCommand alloc] initWithA:a b:b c:c d:d tx:tx ty:ty]];
}

- (void)setTransform:(float)a b:(float)b c:(float)c d:(float)d tx:(float)tx ty:(float)ty {
    [self addCommandToView:[[ARESSetTransformCommand alloc] initWithA:a b:b c:c d:d tx:tx ty:ty]];
}

- (void)setGlobalAlpha:(float)globalAlpha {
    _globalAlpha = globalAlpha;
    [self addCommandToView:[[ARESGlobalAlphaCommand alloc] initWithValue:globalAlpha]];
}

- (void)setGlobalCompositeOperation:(NSString *)globalCompositeOperation {
    _globalCompositeOperation = globalCompositeOperation;
    [self addCommandToView:[[ARESGlobalCompositeOperationCommand alloc] initWithValue:globalCompositeOperation]];
}

- (void)setFillStyle:(NSString *)fillStyle {
    _fillStyle = fillStyle;
    [self addCommandToView:[[ARESFillStyleCommand alloc] initWithValue:fillStyle]];
}

- (void)setStrokeStyle:(NSString *)strokeStyle {
    _strokeStyle = strokeStyle;
    [self addCommandToView:[[ARESStrokeStyleCommand alloc] initWithValue:strokeStyle]];
}

- (void)setLineWidth:(float)lineWidth {
    _lineWidth = lineWidth;
    [self addCommandToView:[[ARESLineWidthCommand alloc] initWithLineWidth:lineWidth]];
}

- (void)setLineCap:(NSString *)lineCap {
    _lineCap = lineCap;
    [self addCommandToView:[[ARESLineCapCommand alloc] initWithValue:lineCap]];
}

- (void)setLineJoin:(NSString *)lineJoin {
    _lineJoin = lineJoin;
    [self addCommandToView:[[ARESLineJoinCommand alloc] initWithValue:lineJoin]];
}

- (void)setMiterLimit:(float)miterLimit {
    _miterLimit = miterLimit;
    [self addCommandToView:[[ARESMiterLimitCommand alloc] initWithValue:miterLimit]];
}

- (void)setShadowOffsetX:(float)shadowOffsetX {
    _shadowOffsetX = shadowOffsetX;
    [self addCommandToView:[[ARESShadowCommand alloc] initWithX:shadowOffsetX
                                                              y:self.shadowOffsetY
                                                           blur:self.shadowBlur
                                                    colorString:self.shadowColor]];
}

- (void)setShadowOffsetY:(float)shadowOffsetY {
    _shadowOffsetY = shadowOffsetY;
    [self addCommandToView:[[ARESShadowCommand alloc] initWithX:self.shadowOffsetX
                                                              y:shadowOffsetY
                                                           blur:self.shadowBlur
                                                    colorString:self.shadowColor]];
}

- (void)setShadowBlur:(float)shadowBlur {
    _shadowBlur = shadowBlur;
    [self addCommandToView:[[ARESShadowCommand alloc] initWithX:self.shadowOffsetX
                                                              y:self.shadowOffsetY
                                                           blur:shadowBlur
                                                    colorString:self.shadowColor]];
}

- (void)setShadowColor:(NSString *)shadowColor {
    _shadowColor = shadowColor;
    [self addCommandToView:[[ARESShadowCommand alloc] initWithX:self.shadowOffsetY
                                                              y:self.shadowOffsetY
                                                           blur:self.shadowBlur
                                                    colorString:shadowColor]];
}

- (void)fillRect:(float)x y:(float)y w:(float)w h:(float)h {
    [self addCommandToView:[[ARESFillRectCommand alloc]
                            initWithX:x
                            y:y
                            w:w
                            h:h]];
}

- (void)strokeRect:(float)x y:(float)y w:(float)w h:(float)h {
    [self addCommandToView:[[ARESStrokeRectCommand alloc]
                            initWithX:x
                            y:y
                            w:w
                            h:h]];
}

- (void)clearRect:(float)x y:(float)y w:(float)w h:(float)h {
    [self addCommandToView:[[ARESClearRectCommand alloc]
                            initWithX:x
                            y:y
                            w:w
                            h:h]];
}

- (void)beginPath {
    [self addCommandToView:[[ARESBeginPathCommand alloc] init]];
}

- (void)closePath {
    [self addCommandToView:[[ARESClosePathCommand alloc] init]];
}

- (void)stroke {
    [self addCommandToView:[[ARESStrokeCommand alloc] init]];
}

- (void)fill {
    [self addCommandToView:[[ARESFillCommand alloc] init]];
}

- (void)lineTo:(float)x y:(float)y {
    [self addCommandToView:[[ARESLineToCommand alloc] initWithX:x y:y]];
}

- (void)moveTo:(float)x y:(float)y {
    [self addCommandToView:[[ARESMoveToCommand alloc] initWithX:x y:y]];
}

- (void)rect:(float)x y:(float)y w:(float)w h:(float)h {
    [self addCommandToView:[[ARESRectCommand alloc] initWithX:x y:y w:w h:h]];
}

- (void)quadraticCurveTo:(float)cpx cpy:(float)cpy x:(float)x y:(float)y {
    [self addCommandToView:[[ARESQuadraticCurveToCommand alloc] initWithCpx:cpx cpy:cpy x:x y:y]];
}

- (void)bezierCurveTo:(float)cp1x cp1y:(float)cp1y cp2x:(float)cp2x cp2y:(float)cp2y x:(float)x y:(float)y {
    [self addCommandToView:[[ARESBezierCurveToCommand alloc] initWithCp1x:cp1x
                                                                     cp1y:cp1y
                                                                     cp2x:cp2x
                                                                     cp2y:cp2y
                                                                        x:x
                                                                        y:y]];
}

- (void)arc:(float)x y:(float)y r:(float)r start:(float)start end:(float)end anticlockwise:(BOOL)anticlockwise {
    [self addCommandToView:[[ARESArcCommand alloc] initWithX:x
                                                           y:y
                                                           r:r
                                                       start:start
                                                         end:end
                                               anticlockwise:anticlockwise]];
}

- (void)arcTo:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 radius:(float)radius {
    [self addCommandToView:[[ARESArcToCommand alloc] initWithX1:x1 y1:y1 x2:x2 y2:y2 radius:radius]];
}

- (void)clip {
    [self addCommandToView:[[ARESClipCommand alloc] init]];
}

- (BOOL)isPointInPath:(float)x y:(float)y {
    return [[ARESBeginPathCommand currentPath] containsPoint:CGPointMake(x, y)];
}

- (void)setFont:(NSString *)font {
    _font = font;
    [self addCommandToView:[[ARESFontCommand alloc] initWithValue:font]];
}

- (void)setTextAlign:(NSString *)textAlign {
    _textAlign = textAlign;
    [self addCommandToView:[[ARESTextAlignCommand alloc] initWithValue:textAlign]];
}

- (void)setTextBaseline:(NSString *)textBaseline {
    _textBaseline = textBaseline;
    [self addCommandToView:[[ARESTextBaselineCommand alloc] initWithValue:textBaseline]];
}

- (void)fillText:(NSString *)text x:(float)x y:(float)y maxWidth:(float)maxWidth {
    [self addCommandToView:[[ARESFillTextCommand alloc] initWithText:text
                                                                   x:x
                                                                   y:y
                                                            maxWidth:maxWidth]];
}

- (void)strokeText:(NSString *)text x:(float)x y:(float)y maxWidth:(float)maxWidth {
    [self addCommandToView:[[ARESStrokeTextCommand alloc] initWithText:text
                                                                     x:x
                                                                     y:y
                                                              maxWidth:maxWidth]];
}

- (NSDictionary *)measureText:(NSString *)text {
    return [ARESMeasureTextCommand measureText:text];
}

- (void)drawImage:(ARESJSImage *)image
           sxOrDx:(float)sxOrDx
           syOrDy:(float)syOrDy
           swOrDw:(float)swOrDw
           shOrDh:(float)shOrDh
               dx:(float)dx
               dy:(float)dy
               dw:(float)dw
               dh:(float)dh {
    if (!isnan(dx)) {
        [self addCommandToView:[[ARESDrawImageCommand alloc] initWithImage:image.image
                                                                        dx:dx
                                                                        dy:dy
                                                                        dw:dw
                                                                        dh:dh
                                                                        sx:sxOrDx
                                                                        sy:syOrDy
                                                                        sw:swOrDw
                                                                        sh:shOrDh]];
    }
    else {
        [self addCommandToView:[[ARESDrawImageCommand alloc] initWithImage:image.image
                                                                        dx:sxOrDx
                                                                        dy:syOrDy
                                                                        dw:swOrDw
                                                                        dh:shOrDh
                                                                        sx:NAN
                                                                        sy:NAN
                                                                        sw:NAN
                                                                        sh:NAN]];
    }
}

- (void)addCommandToView:(ARESCommand *)command {
    if (command == nil) {
        return;
    }
    ARESView *view = [ARESJSBridge viewWithContext:[JSContext currentContext]];
    if (view != nil) {
        [view addCommand:command];
    }
}

@end
