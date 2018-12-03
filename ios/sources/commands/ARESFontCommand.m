//
//  ARESFontCommand.m
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFontCommand.h"

@implementation ARESFontCommand

static UIFont *currentFont;

+ (UIFont *)currentFont {
    return currentFont;
}

static UIFont *stateFont;

+ (UIFont *)stateFont {
    return stateFont;
}

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        [self parse:value];
    }
    return self;
}

- (void)parse:(NSString *)value {
    if ([value containsString:@"px"]) {
        CGFloat fontSize = 10.0;
        NSString *fontFamily = nil;
        NSArray<NSString *> *valueComponents = [value componentsSeparatedByString:@" "];
        for (NSString *component in valueComponents) {
            if ([component hasSuffix:@"px"]) {
                fontSize = [[component stringByReplacingOccurrencesOfString:@"px" withString:@""]
                            floatValue];
            }
            else {
                fontFamily = component;
            }
        }
        if (fontFamily != nil) {
            NSArray *fontNames = [UIFont fontNamesForFamilyName:fontFamily];
            if (fontNames.count > 0) {
                self.font = [UIFont fontWithName:fontNames.firstObject size:fontSize];
            }
            else {
                self.font = [UIFont systemFontOfSize:fontSize];
            }
        }
        else {
            self.font = [UIFont systemFontOfSize:fontSize];
        }
    }
    else {
        self.font = [UIFont systemFontOfSize:10];
    }
    stateFont = self.font;
}

- (void)draw:(CGContextRef)ctx {
    currentFont = self.font;
}

@end
