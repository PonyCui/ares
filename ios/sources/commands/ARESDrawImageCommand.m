//
//  ARESDrawImageCommand.m
//  ares
//
//  Created by PonyCui on 2018/12/4.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESDrawImageCommand.h"

@implementation ARESDrawImageCommand

- (instancetype)initWithImage:(UIImage *)image
                           dx:(CGFloat)dx
                           dy:(CGFloat)dy
                           dw:(CGFloat)dw
                           dh:(CGFloat)dh
                           sx:(CGFloat)sx
                           sy:(CGFloat)sy
                           sw:(CGFloat)sw
                           sh:(CGFloat)sh
{
    self = [super init];
    if (self) {
        _image = image;
        _dx = dx;
        _dy = dy;
        _dw = dw;
        _dh = dh;
        _sx = sx;
        _sy = sy;
        _sw = sw;
        _sh = sh;
    }
    return self;
}

- (void)draw:(CGContextRef)ctx {
    if (isnan(self.dx) || isnan(self.dy)) {
        return;
    }
    if (!isnan(self.sx) && !isnan(self.sy) && !isnan(self.sw) && !isnan(self.sh) && !isnan(self.dw) && !isnan(self.dh)) {
        if (self.sw <= 0.0 || self.sh <= 0.0) {
            return;
        }
        CGContextRef cropCtx = CGBitmapContextCreate(NULL,
                                                     self.sw,
                                                     self.sh,
                                                     8,
                                                     self.sw * 4,
                                                     CGColorSpaceCreateDeviceRGB(),
                                                     kCGImageAlphaPremultipliedLast);
        CGContextDrawImage(cropCtx, CGRectMake(-self.sx,
                                               -(self.image.size.height - self.sh - self.sy),
                                               self.image.size.width,
                                               self.image.size.height),
                           self.image.CGImage);
        CGImageRef croppedImage = CGBitmapContextCreateImage(cropCtx);
        CGContextSaveGState(ctx);
        CGContextTranslateCTM(ctx, 0.0, CGBitmapContextGetHeight(ctx));
        CGContextScaleCTM(ctx, 1.0, -1.0);
        CGContextDrawImage(ctx,
                           CGRectMake(self.dx,
                                      CGBitmapContextGetHeight(ctx) - self.dh - self.dy,
                                      self.dw,
                                      self.dh),
                           croppedImage);
        CGContextRestoreGState(ctx);
        CGImageRelease(croppedImage);
        CGContextRelease(cropCtx);
    }
    else {
        CGContextSaveGState(ctx);
        CGContextTranslateCTM(ctx, 0.0, CGBitmapContextGetHeight(ctx));
        CGContextScaleCTM(ctx, 1.0, -1.0);
        if (!isnan(self.dw) && !isnan(self.dh)) {
            CGContextDrawImage(ctx,
                               CGRectMake(self.dx,
                                          CGBitmapContextGetHeight(ctx) - self.dh - self.dy,
                                          self.dw,
                                          self.dh),
                               self.image.CGImage);
        }
        else {
            CGContextDrawImage(ctx,
                               CGRectMake(self.dx,
                                          CGBitmapContextGetHeight(ctx) - self.image.size.height - self.dy,
                                          self.image.size.width,
                                          self.image.size.height),
                               self.image.CGImage);
        }
        CGContextRestoreGState(ctx);
    }
}

@end
