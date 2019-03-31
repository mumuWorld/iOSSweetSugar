//
//  UIImage+Tools.m
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/31.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import "UIImage+Tools.h"

@implementation UIImage (Tools)

+ (UIImage *)mm_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//圆形图片
+ (UIImage *)mm_circleImage:(UIImage *)image withSize:(CGSize)size {
    // Param 2 不透明的:如果图形完全不用透明，设置为YES以优化位图的存储。
    //param 3 缩放因子:,iPhone 4是2.0，其他是1.0。虽然这里可以用[UIScreen mainScreen].scale来获取，但实际上设为0后，系统就会自动设置正确的比例了.
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    [path addClip];
    [image drawInRect:rect];
    UIImage *circle_image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return circle_image;
}
+ (void)mm_asyncCircleImage:(UIImage *)image withSize:(CGSize)size withComplite:(void(^)(UIImage *circle_image))handler {
    if (!handler) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        [path addClip];
        [image drawInRect:rect];
        UIImage *circle_image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(circle_image);
        });
    });
}
@end
