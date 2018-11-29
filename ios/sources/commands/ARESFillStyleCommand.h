//
//  ARESFillStyleCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESFillStyleCommand : ARESCommand

@property (nonatomic, readonly) UIColor *color;

@end

NS_ASSUME_NONNULL_END