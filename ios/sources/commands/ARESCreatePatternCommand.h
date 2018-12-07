//
//  ARESCreatePatternCommand.h
//  ares
//
//  Created by PonyCui on 2018/12/7.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@class ARESJSImage;

@interface ARESCreatePatternCommand : ARESCommand

@property (nonatomic, readonly) UIColor *color;
@property (nonatomic, strong) ARESJSImage *image;
@property (nonatomic, strong) NSString *repetition;

- (instancetype)initWithImage:(ARESJSImage *)image repetition:(NSString *)repetition;

@end

NS_ASSUME_NONNULL_END
