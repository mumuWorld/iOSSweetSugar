//
//  MMDispatchTimer.h
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/25.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMDispatchTimer : NSObject

/**
 构造定时器
 
 @param task block
 @param startT 多少秒后执行
 @param interval 重复时间
 @param isRepeat 是否重复
 @param isAsync 是否异步
 @return 对应的timer的key。
 */
+ (NSString *)excuTimerTask:(void(^)(void))task andStart:(NSTimeInterval)startT interval:(NSTimeInterval)interval repeats:(BOOL)isRepeat async:(BOOL)isAsync;

/**
 sel定时器
 
 @param task SEL
 @param target target
 @param startT 多少秒后执行
 @param interval 重复时间
 @param isRepeat 是否重复
 @param isAsync 是否异步
 @return 对应的timer的key。
 */
+ (NSString *)excuTimerSelector:(SEL)task target:(id)target andStart:(NSTimeInterval)startT interval:(NSTimeInterval)interval repeats:(BOOL)isRepeat async:(BOOL)isAsync;
/**
 取消定时器
 
 @param name key
 */
+ (void)cancelTask:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
