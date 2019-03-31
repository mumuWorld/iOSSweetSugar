//
//  UIColor+Tools.m
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/31.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import "UIColor+Tools.h"

@implementation UIColor (Tools)
+ (UIColor *)mm_randomColor {
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

+ (UIColor *)mm_colorWithHex:(uint) hex {
    return [UIColor mm_colorWithHex:hex alpha:1.0];
}

+ (UIColor *)mm_colorWithHex:(uint) hex alpha:(CGFloat)alpha {
    int red, green, blue;
    blue = hex & 0x0000FF;
    green = ((hex & 0x00FF00) >> 8);
    red = ((hex & 0xFF0000) >> 16);
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (UIColor *)mm_colorWithHexString:(NSString *)hexString
{
    return [self mm_colorWithHexString:hexString alpha:1.0];
}
+ (UIColor *)mm_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    if ([hexString hasPrefix:@"#"]) {
        hexString=[hexString substringFromIndex:1];
    }
    if ([hexString hasPrefix:@"0x"] || [hexString hasPrefix:@"0X"]) {
        hexString = [hexString substringFromIndex:2];
    }
    if (hexString.length != 6) {
        return [UIColor clearColor];
    }
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    unsigned long long colorValue = 0;
    [scanner scanHexLongLong:&colorValue];
    unsigned long long redValue = (colorValue & 0xFF0000) >> 16;
    unsigned long long greenValue = (colorValue & 0xFF00) >> 8;
    unsigned long long blueValue = colorValue & 0xFF;
    return [UIColor colorWithRed:redValue/255.0 green:greenValue/255.0 blue:blueValue/255.0 alpha:alpha];
}
@end
