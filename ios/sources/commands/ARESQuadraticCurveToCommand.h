//
//  ARESQuadraticCurveToCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"
#import "ARESBeginPathCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESQuadraticCurveToCommand : ARESCommand

@property (nonatomic, assign) CGFloat cpx;
@property (nonatomic, assign) CGFloat cpy;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

- (instancetype)initWithCpx:(float)cpx cpy:(float)cpy x:(float)x y:(float)y;

@end

NS_ASSUME_NONNULL_END
