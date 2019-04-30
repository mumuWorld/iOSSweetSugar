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
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path addClip];
    [image drawInRect:rect];
    UIImage *circle_image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return circle_image;
}
+ (void)mm_asyncCircleImage:(UIImage *)image withSize:(CGSize)size fillColor:(UIColor *)fillColor withComplite:(void(^)(UIImage *circle_image))handler {
    if (!handler) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:rect];
        [fillColor set];
        [rectPath fill];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        [path addClip];
        [image drawInRect:rect];
        UIImage *circle_image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(circle_image);
        });
    });
}
#pragma mark - ----------------------截屏
+ (UIImage *)mm_imageWithView:(UIView *)view
{
    CGRect rect = view.bounds;
    if (CGRectIsEmpty(rect) ||
        CGRectIsNull(rect) ||
        CGRectIsInfinite(rect) ||
        view.superview == nil ||
        view.window == nil ||
        view.window.hidden ) { //window hidden的时候，直接retrun
        return nil;
    }
    
    //https://github.com/kif-framework/KIF/issues/679
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0f);
    
    UIImage * snapshotImage = NULL;
    
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        BOOL drawSuccess = [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
        if (drawSuccess) {
            snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        }
    } else {
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    
    UIGraphicsEndImageContext();
    
    if (!snapshotImage){ //如果不存在用最传统的方法。
        snapshotImage = [self mm_snapshotImage:view];
    }
    
    return snapshotImage;
}

+ (UIImage *)mm_snapshotImage:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

/**
 从bundle中获取图片 节约内存开销
 */
+ (UIImage *)mm_imageWithFileName:(NSString *)name andType:(nullable NSString *)type {
    if (!name) {
        return nil;
    }
    NSString *imageName;
    if (type.length < 1) {
        imageName = [NSString stringWithFormat:@"%@.png",name];
    } else {
        imageName = [NSString stringWithFormat:@"%@.%@",name,type];
    }
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}
/**
 传入需要的占位图尺寸 获取占位图
 
 @param size 需要的站位图尺寸
 @return 占位图
 */
+ (UIImage *)placeholderImageWithSize:(CGSize)size {
    
    // 占位图的背景色
    UIColor *backgroundColor = [UIColor grayColor];
    UIGraphicsBeginImageContextWithOptions(size,0, [UIScreen mainScreen].scale);
    [backgroundColor set];
    
    if (size.width > 48 && size.height > 48) {// 小于48pt 不显示logo图片
        // 中间LOGO图片
        UIImage *image = [UIImage imageNamed:@"占位图"];
        // 根据占位图需要的尺寸 计算 中间LOGO的宽高
        CGSize logoSize = image.size;
        // 绘图
        UIRectFill(CGRectMake(0,0, size.width, size.height));
        CGFloat imageX = (size.width / 2) - (logoSize.width / 2);
        CGFloat imageY = (size.height / 2) - (logoSize.height / 2);
        [image drawInRect:CGRectMake(imageX, imageY, logoSize.width, logoSize.height)];
    }
    UIImage *resImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
    
}
@end
