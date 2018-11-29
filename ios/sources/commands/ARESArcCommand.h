//
//  ARESArcCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"
#import "ARESBeginPathCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESArcCommand : ARESCommand

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat r;
@property (nonatomic, assign) CGFloat start;
@property (nonatomic, assign) CGFloat end;
@property (nonatomic, assign) BOOL anticlockwise;

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                        r:(CGFloat)r
                    start:(CGFloat)start
                      end:(CGFloat)end
            anticlockwise:(BOOL)anticlockwise;

@end

NS_ASSUME_NONNULL_END
