//
//  ARESArcToCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"
#import "ARESBeginPathCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESArcToCommand : ARESCommand

@property (nonatomic, assign) CGFloat x1;
@property (nonatomic, assign) CGFloat y1;
@property (nonatomic, assign) CGFloat x2;
@property (nonatomic, assign) CGFloat y2;
@property (nonatomic, assign) CGFloat radius;

- (instancetype)initWithX1:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 radius:(float)radius;

@end

NS_ASSUME_NONNULL_END
