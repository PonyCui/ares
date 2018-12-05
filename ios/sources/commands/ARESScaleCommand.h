//
//  ARESScaleCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESScaleCommand : ARESCommand

@property (nonatomic, assign) CGFloat sx;
@property (nonatomic, assign) CGFloat sy;

- (instancetype)initWithSx:(CGFloat)sx sy:(CGFloat)sy;

@end

NS_ASSUME_NONNULL_END
