//
//  ARESLineWidthCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESLineWidthCommand : ARESCommand

@property (nonatomic, assign) CGFloat lineWidth;

- (instancetype)initWithLineWidth:(CGFloat)lineWidth;

@end

NS_ASSUME_NONNULL_END
