//
//  ARESState.h
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESState : ARESCommand

@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat lineWidth;

- (ARESState *)clone;

@end

NS_ASSUME_NONNULL_END
