//
//  ARESShadowCommand.h
//  ares
//
//  Created by PonyCui on 2018/12/4.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESShadowCommand : ARESCommand

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat blur;
@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithX:(CGFloat)x y:(CGFloat)y blur:(CGFloat)blur colorString:(NSString *)colorString;

@end

NS_ASSUME_NONNULL_END
