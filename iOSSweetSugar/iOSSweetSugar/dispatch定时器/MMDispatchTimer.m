//
//  MMDispatchTimer.m
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/25.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import "MMDispatchTimer.h"
#import <pthread.h>

@implementation MMDispatchTimer


static NSMutableDictionary *timers_;

pthread_mutex_t mutex_l;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [NSMutableDictionary dictionary];
        pthread_mutex_init(&mutex_l, NULL);
    });
}
+ (NSString *)excuTimerTask:(void(^)(void))task andStart:(NSTimeInterval)startT interval:(NSTimeInterval)interval repeats:(BOOL)isRepeat async:(BOOL)isAsync {
    if (!task || startT < 0 || (interval <= 0 && isRepeat)) return nil;
    dispatch_queue_t queue = isAsync? dispatch_get_global_queue(0, 0):dispatch_get_main_queue();
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, startT * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0);
    pthread_mutex_lock(&mutex_l);
    NSString *timerN = [NSString stringWithFormat:@"timers_%ld",(unsigned long)timers_.count];
    [timers_ setObject:timer forKey:timerN];
    pthread_mutex_unlock(&mutex_l);
    dispatch_source_set_event_handler(timer, ^{
        task();
        if (!isRepeat) {
            [self cancelTask:timerN];
        }
    });
    dispatch_resume(timer);
    return timerN;
}
+ (NSString *)excuTimerSelector:(SEL)task target:(id)target andStart:(NSTimeInterval)startT interval:(NSTimeInterval)interval repeats:(BOOL)isRepeat async:(BOOL)isAsync {
    if (!task || !target) return nil;
    
    return [self excuTimerTask:^{
        if ([target respondsToSelector:task]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [target performSelector:task];
#pragma clang diagnostic pop
        }
    } andStart:startT interval:interval repeats:isRepeat async:isAsync];
}
+ (void)cancelTask:(NSString *)name {
    if (name.length <= 0) {
        return;
    }
    dispatch_source_t timer = [timers_ objectForKey:name];
    if (timer) {
        dispatch_source_cancel(timer);
        pthread_mutex_lock(&mutex_l);
        [timers_ removeObjectForKey:name];
        pthread_mutex_unlock(&mutex_l);
    }
}
@end
