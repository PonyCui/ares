//
//  UIColor+ARESParser.h
//  ares
//
//  Created by errnull on 2018/12/3.
//  Copyright © 2018 XT Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ARESParser)

+ (instancetype)ares_parseColorWithValue:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
