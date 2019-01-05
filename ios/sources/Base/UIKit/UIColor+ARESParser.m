//
//  UIColor+ARESParser.m
//  ares
//
//  Created by errnull on 2018/12/3.
//  Copyright © 2018 XT Studio. All rights reserved.
//

#import "UIColor+ARESParser.h"
#import "UIColor+ARESName.h"

@implementation UIColor (ARESParser)
    
+ (instancetype)ares_parseColorWithValue:(NSString *)value {
    // remore spacing
    value = [value stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if ([value containsString:@"rgb"]) {
        return [self parseRGBColorWithValue:value];
    } else if ([value containsString:@"hsl"]) {
        return [self parseHSLColorWithValue:value];
    } else if ([value containsString:@"hwb"]) {
        return [self parseHWBColorWithValue:value];
    } else {
        return [self parseHEXColorWithValue:value];
    }
}
    
+ (instancetype)parseRGBColorWithValue:(NSString *)value {
    
    NSString *rgbaPattern = @"^[rR][gG][Bb][Aa]?[\(]((2[0-4][0-9]|25[0-5]|[01]?[0-9][0-9]?),){2}(2[0-4][0-9]|25[0-5]|[01]?[0-9][0-9]?),?(0.d{1,2}|1|0)?[)]{1}$";
    NSRegularExpression *rgbaRegular = [[NSRegularExpression alloc] initWithPattern:rgbaPattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSArray *rgbaResults = [rgbaRegular matchesInString:value options:NSMatchingReportProgress range:NSMakeRange(0, value.length)];
    if (rgbaResults.count > 0) {
        NSTextCheckingResult *result = rgbaResults.firstObject;
        NSString *colorString = [value substringWithRange:result.range];
        NSString *removeRGBAString = [colorString stringByReplacingOccurrencesOfString:@"rgba(" withString:@""];
        NSString *removeRGBString = [removeRGBAString stringByReplacingOccurrencesOfString:@"rgb(" withString:@""];
        NSString *resultString = [removeRGBString stringByReplacingOccurrencesOfString:@")" withString:@""];
        
        NSArray *resultArray = [resultString componentsSeparatedByString:@","];
        if (resultArray.count == 3) {
            return [UIColor colorWithRed: [resultArray[0] floatValue] / 255.0
                                   green: [resultArray[1] floatValue] / 255.0
                                    blue: [resultArray[2] floatValue] / 255.0
                                   alpha: 1];
        }
        
        if (resultArray.count == 4) {
            return [UIColor colorWithRed: [resultArray[0] floatValue] / 255.0
                                   green: [resultArray[1] floatValue] / 255.0
                                    blue: [resultArray[2] floatValue] / 255.0
                                   alpha: [resultArray[3] floatValue]];
        }
    }
    // The default value is 'black'
    return [UIColor blackColor];
}
    
+ (instancetype)parseHSLColorWithValue:(NSString *)value {
    return nil;
}
    
+ (instancetype)parseHWBColorWithValue:(NSString *)value {
    return nil;
}
    
+ (instancetype)parseHEXColorWithValue:(NSString *)value {
    
    NSString *hexPattern = @"^#([a-f0-9]{6})([a-f0-9]{2})?$";
    NSRegularExpression *hexRegular = [[NSRegularExpression alloc] initWithPattern:hexPattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSArray *hexResults = [hexRegular matchesInString:value options:NSMatchingReportProgress range:NSMakeRange(0, value.length)];
    if (hexResults.count > 0) {
        NSTextCheckingResult *result = hexResults.firstObject;
        NSString *colorString = [[value substringWithRange:result.range] stringByReplacingOccurrencesOfString:@"#" withString:@""];
        CGFloat alpha, red, blue, green;
        
        switch ([colorString length]) {
            case 3: // #RGB
            alpha = 1.0f;
            red   = [self parseComponentFrom: colorString start: 0 length: 1];
            green = [self parseComponentFrom: colorString start: 1 length: 1];
            blue  = [self parseComponentFrom: colorString start: 2 length: 1];
            break;
            case 4: // #RGBA
            blue  = [self parseComponentFrom: colorString start: 0 length: 1];
            red   = [self parseComponentFrom: colorString start: 1 length: 1];
            green = [self parseComponentFrom: colorString start: 2 length: 1];
            alpha = [self parseComponentFrom: colorString start: 3 length: 1];
            break;
            case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self parseComponentFrom: colorString start: 0 length: 2];
            green = [self parseComponentFrom: colorString start: 2 length: 2];
            blue  = [self parseComponentFrom: colorString start: 4 length: 2];
            break;
            case 8: // #RRGGBBAA
            blue  = [self parseComponentFrom: colorString start: 0 length: 2];
            red   = [self parseComponentFrom: colorString start: 2 length: 2];
            green = [self parseComponentFrom: colorString start: 4 length: 2];
            alpha = [self parseComponentFrom: colorString start: 6 length: 2];
            break;
            default:
            return nil;
        }
        return [UIColor colorWithRed: red
                               green: green
                                blue: blue
                               alpha: alpha];
    }
    if ([value isEqualToString:@"transparent"]) {
        return [UIColor colorWithRed: 0.0f
                               green: 0.0f
                                blue: 0.0f
                               alpha: 0.0f];
    }
    // The default value is 'black'
    return [self ares_colorWithColorName:value];
}
    
+ (CGFloat)parseComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@end
