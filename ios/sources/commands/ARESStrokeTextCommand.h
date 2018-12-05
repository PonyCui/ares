//
//  ARESStrokeTextCommand.h
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESStrokeTextCommand : ARESCommand

@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat maxWidth;

- (instancetype)initWithText:(NSString *)text x:(CGFloat)x y:(CGFloat)y maxWidth:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
