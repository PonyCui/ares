//
//  ARESSetTransformCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESSetTransformCommand : ARESCommand

@property (nonatomic, assign) CGFloat a;
@property (nonatomic, assign) CGFloat b;
@property (nonatomic, assign) CGFloat c;
@property (nonatomic, assign) CGFloat d;
@property (nonatomic, assign) CGFloat tx;
@property (nonatomic, assign) CGFloat ty;

- (instancetype)initWithA:(CGFloat)a b:(CGFloat)b c:(CGFloat)c d:(CGFloat)d tx:(CGFloat)tx ty:(CGFloat)ty;

@end

NS_ASSUME_NONNULL_END
