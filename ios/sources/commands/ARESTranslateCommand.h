//
//  ARESTranslateCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/30.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESTranslateCommand : ARESCommand

@property (nonatomic, assign) CGFloat tx;
@property (nonatomic, assign) CGFloat ty;

- (instancetype)initWithTx:(CGFloat)tx ty:(CGFloat)ty;

@end

NS_ASSUME_NONNULL_END
