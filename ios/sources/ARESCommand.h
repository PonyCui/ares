//
//  ARESCommand.h
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARESCommand : NSObject

@property (nonatomic, readonly, nonnull) NSString *method;
@property (nonatomic, readonly, nullable) NSArray *arguments;

- (instancetype)initWithMethod:(NSString *)method
                     arguments:(NSArray *)arguments;

- (void)draw:(CGContextRef)ctx;

@end

NS_ASSUME_NONNULL_END
