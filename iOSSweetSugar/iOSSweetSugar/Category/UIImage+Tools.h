//
//  UIImage+Tools.h
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/31.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Tools)

/**
 返回纯色图片

 @param color color
 @return image
 */
+ (UIImage *)mm_imageWithColor:(UIColor *)color;


/**
 同步绘制圆形图片

 @param image image
 @param size size
 @return circle_image
 */
+ (UIImage *)mm_circleImage:(UIImage *)image withSize:(CGSize)size;

/**
 异步绘制圆形图片

 @param image image
 @param size size
 @param handler 回调block
 */
+ (void)mm_asyncCircleImage:(UIImage *)image withSize:(CGSize)size withComplite:(void(^)(UIImage *circle_image))handler;


/**
 截屏

 @param view 传入的view
 @return UIImage
 */
+ (UIImage *)mm_imageWithView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
