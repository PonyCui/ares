//
//  ARESFillTextCommand.m
//  ares
//
//  Created by PonyCui on 2018/12/3.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESFillTextCommand.h"
#import "ARESFontCommand.h"
#import "ARESTextAlignCommand.h"
#import "ARESTextBaselineCommand.h"
#import "ARESView.h"
#import <CoreText/CoreText.h>

@implementation ARESFillTextCommand

- (instancetype)initWithText:(NSString *)text x:(CGFloat)x y:(CGFloat)y maxWidth:(CGFloat)maxWidth
{
    self = [super init];
    if (self) {
        _text = text;
        _x = x;
        _y = y;
        _maxWidth = maxWidth;
    }
    return self;
}

- (NSAttributedString *)createAttributedString:(ARESView *)view {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    UIFont *font = [ARESFontCommand currentFont] ?: [UIFont systemFontOfSize:10];
    [attributes setObject:font
                   forKey:NSFontAttributeName];
    if ([view currentState].fillColor != nil) {
        [attributes setObject:[view currentState].fillColor forKey:NSForegroundColorAttributeName];
    }
    if ([ARESTextBaselineCommand currentValue] != nil) {
        if ([[ARESTextBaselineCommand currentValue] isEqualToString:@"top"]) {
            [attributes setObject:@(font.ascender) forKey:NSBaselineOffsetAttributeName];
        }
        else if ([[ARESTextBaselineCommand currentValue] isEqualToString:@"middle"]) {
            [attributes setObject:@(font.ascender - (font.ascender - font.descender) / 2.0)
                           forKey:NSBaselineOffsetAttributeName];
        }
        else if ([[ARESTextBaselineCommand currentValue] isEqualToString:@"bottom"]) {
            [attributes setObject:@(font.descender) forKey:NSBaselineOffsetAttributeName];
        }
    }
    return [[NSAttributedString alloc] initWithString:self.text
                                           attributes:attributes.copy];
}

- (void)draw:(CGContextRef)ctx view:(ARESView *)view {
    CTLineRef lineRef = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)[self createAttributedString:view]);
    CGRect bounds = CTLineGetBoundsWithOptions(lineRef, kNilOptions);
    CGFloat drawX = self.x;
    if ([ARESTextAlignCommand currentValue] != nil) {
        if ([[ARESTextAlignCommand currentValue] isEqualToString:@"center"]) {
            drawX = self.x - bounds.size.width / 2.0;
        }
        else if ([[ARESTextAlignCommand currentValue] isEqualToString:@"right"] ||
                 [[ARESTextAlignCommand currentValue] isEqualToString:@"end"]) {
            drawX = self.x - bounds.size.width;
        }
    }
    if (self.maxWidth > 0 && bounds.size.width > self.maxWidth) {
        CGContextSaveGState(ctx);
        CGContextTranslateCTM(ctx, drawX, 0.0);
        CGContextScaleCTM(ctx, self.maxWidth / bounds.size.width, 1.0);
        CGContextSetTextPosition(ctx, 0.0, self.y);
        CTLineDraw(lineRef, ctx);
        CGContextRestoreGState(ctx);
        CFRelease(lineRef);
    }
    else {
        CGContextSetTextPosition(ctx, drawX, self.y);
        CTLineDraw(lineRef, ctx);
        CFRelease(lineRef);
    }
}

@end
