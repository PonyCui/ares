//
//  ARESMeasureTextCommand.m
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESMeasureTextCommand.h"
#import "ARESFontCommand.h"

@implementation ARESMeasureTextCommand

+ (NSDictionary *)measureText:(NSString *)text {
    NSAttributedString *attributedString = [[NSAttributedString alloc]
                                            initWithString:text
                                            attributes:@{
                                                         NSFontAttributeName: [ARESFontCommand stateFont] ?: [UIFont systemFontOfSize:10]
                                                         }];
    return @{
             @"width": @([attributedString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                        options:kNilOptions
                                                        context:nil].size.width)
             };
}

@end
