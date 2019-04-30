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
+ (void)mm_asyncCircleImage:(UIImage *)image withSize:(CGSize)size fillColor:(UIColor *)fillColor withComplite:(void(^)(UIImage *circle_image))handler;


/**
 截屏

 @param view 传入的view
 @return UIImage
 */
+ (UIImage *)mm_imageWithView:(UIView *)view;

/**
 从bundle中获取图片 节约内存开销,默认 png。
 */
+ (UIImage *)mm_imageWithFileName:(NSString *)name andType:(nullable NSString *)type;

/**
 传入需要的占位图尺寸 获取占位图
 
 @param size 需要的站位图尺寸
 @return 占位图
 */
+ (UIImage *)placeholderImageWithSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
