//
//  ARESRectCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"
#import "ARESBeginPathCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESRectCommand : ARESCommand

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;

- (instancetype)initWithX:(float)x y:(float)y w:(float)w h:(float)h;

@end

NS_ASSUME_NONNULL_END
