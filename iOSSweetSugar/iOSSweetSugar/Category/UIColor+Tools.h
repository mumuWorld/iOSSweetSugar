//
//  UIColor+Tools.h
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/31.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Tools)

/**
 随机颜色

 @return UIColor
 */
+ (UIColor *)mm_randomColor;


/**
 十六进制颜色

 @param hex 0x333333
 @param alpha 0~1.0
 @return UIColor
 */
+ (UIColor *)mm_colorWithHex:(uint) hex alpha:(CGFloat)alpha;
+ (UIColor *)mm_colorWithHex:(uint) hex;

/**
  十六进制颜色

 @param hexString @"0x333333"
 @param alpha 0~1.0
 @return UIColor
 */
+ (UIColor *)mm_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)mm_colorWithHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
