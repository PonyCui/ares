//
//  ARESMeasureTextCommand.h
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARESMeasureTextCommand : ARESCommand

+ (NSDictionary *)measureText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
