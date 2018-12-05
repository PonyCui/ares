//
//  ARESDrawImageCommand.h
//  ares
//
//  Created by PonyCui on 2018/12/4.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARESDrawImageCommand : ARESCommand

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) CGFloat sx;
@property (nonatomic, assign) CGFloat sy;
@property (nonatomic, assign) CGFloat sw;
@property (nonatomic, assign) CGFloat sh;
@property (nonatomic, assign) CGFloat dx;
@property (nonatomic, assign) CGFloat dy;
@property (nonatomic, assign) CGFloat dw;
@property (nonatomic, assign) CGFloat dh;

- (instancetype)initWithImage:(UIImage *)image
                            dx:(CGFloat)dx
                            dy:(CGFloat)dy
                            dw:(CGFloat)dw
                            dh:(CGFloat)dh
                            sx:(CGFloat)sx
                            sy:(CGFloat)sy
                            sw:(CGFloat)sw
                            sh:(CGFloat)sh;

@end

NS_ASSUME_NONNULL_END
