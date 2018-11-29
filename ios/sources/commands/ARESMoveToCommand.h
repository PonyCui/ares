//
//  ARESMoveToCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"
#import "ARESBeginPathCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESMoveToCommand : ARESCommand

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

- (instancetype)initWithX:(CGFloat)x y:(CGFloat)y;

@end

NS_ASSUME_NONNULL_END
