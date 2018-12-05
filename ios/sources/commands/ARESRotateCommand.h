//
//  ARESRotateCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESRotateCommand : ARESCommand

@property (nonatomic, assign) CGFloat angle;

- (instancetype)initWithAngle:(CGFloat)angle;

@end

NS_ASSUME_NONNULL_END
