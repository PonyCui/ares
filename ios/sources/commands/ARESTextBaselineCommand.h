//
//  ARESTextBaselineCommand.h
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESTextBaselineCommand : ARESCommand

+ (NSString *)currentValue;

@property (nonatomic, strong) NSString *value;

- (instancetype)initWithValue:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
