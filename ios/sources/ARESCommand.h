//
//  ARESCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ARESView;

@interface ARESCommand : NSObject

- (void)draw:(CGContextRef)ctx view:(ARESView *)view;

- (void)draw:(CGContextRef)ctx;

@end

NS_ASSUME_NONNULL_END
