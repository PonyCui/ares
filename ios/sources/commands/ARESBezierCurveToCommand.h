//
//  ARESBezierCurveToCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/29.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"
#import "ARESBeginPathCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESBezierCurveToCommand : ARESCommand

@property (nonatomic, assign) CGFloat cp1x;
@property (nonatomic, assign) CGFloat cp1y;
@property (nonatomic, assign) CGFloat cp2x;
@property (nonatomic, assign) CGFloat cp2y;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

- (instancetype)initWithCp1x:(float)cp1x
                        cp1y:(float)cp1y
                        cp2x:(float)cp2x
                        cp2y:(float)cp2y
                           x:(float)x
                           y:(float)y;

@end

NS_ASSUME_NONNULL_END
