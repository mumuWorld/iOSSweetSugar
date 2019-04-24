//
//  NSDate+Tools.m
//  iOSSweetSugar
//
//  Created by yangjie on 2019/4/24.
//  Copyright © 2019 Mumu. All rights reserved.
//

#import "NSDate+Tools.h"

NSString *const cDateFormatterTypeDefault = @"yyyy-MM-dd HH:mm:ss";
NSString *const cDateFormatterTypeShortYMD = @"yyyy-MM-dd";
NSString *const cDateFormatterTypeSeparateYMD = @"yyyy, MM , DD";
//避免重复创建formatter对象 耗费性能
static NSDateFormatter *shareFormatter = nil;

@implementation NSDate (Tools)
+ (void)initialize {
    shareFormatter = [[NSDateFormatter alloc] init];
}

+ (NSString *)mm_getDateString:(NSInteger)timeStamp format:(cDateFormatterStringKey)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [self mm_getDateStringUsingDate:date format:format];
}
+ (NSString *)mm_getDateStringUsingDate:(NSDate *)date format:(cDateFormatterStringKey)format {
    shareFormatter.locale = [NSLocale currentLocale];
    shareFormatter.timeZone = [NSTimeZone localTimeZone];
    if ([format isEqualToString:cDateFormatterTypeSeparateYMD]) {
        return nil;
    }
    shareFormatter.dateFormat = format;
    NSString *destDateString = [shareFormatter stringFromDate:date];
    return destDateString;
}
+ (NSArray *)mm_getDataArrayUsing:(NSDate*)date format:(cDateFormatterStringKey)format {
    if (![format isEqualToString:cDateFormatterTypeSeparateYMD]) {
        return nil;
    }
    NSMutableArray *array = [NSMutableArray array];
    shareFormatter.locale = [NSLocale currentLocale];
    shareFormatter.timeZone = [NSTimeZone localTimeZone];
    shareFormatter.dateFormat = @"yyyy";
    NSString *yy = [shareFormatter stringFromDate:date];
    [array addObject:yy];
    shareFormatter.dateFormat = @"MM";
    NSString *mm = [shareFormatter stringFromDate:date];
    [array addObject:mm];
    shareFormatter.dateFormat = @"dd";
    NSString *day = [shareFormatter stringFromDate:date];
    [array addObject:day];
    return [array copy];
}
#pragma mark - 获取字符串时间戳
+ (NSString *)mm_getTimeStampWith:(NSString *)date format:(cDateFormatterStringKey)format {
    shareFormatter.dateFormat = format;
    shareFormatter.locale = [NSLocale currentLocale];
    shareFormatter.timeZone = [NSTimeZone localTimeZone];
    NSDate *tDate = [shareFormatter dateFromString:date];
    NSTimeInterval time = [tDate timeIntervalSince1970];
    return [NSString stringWithFormat:@"%d",(NSInteger)time];
}
+ (NSString *)mm_compareCurrentTime:(NSInteger)timeStamp {
    //计算时间差值
    NSTimeInterval timeInterval = [self mm_getIntervalTimeCompareCurrentTime:timeStamp];
    long temp = 0;
    NSString *result;
    if (timeInterval/60 < 1) {
        result = [NSString stringWithFormat:@"刚刚"];
    } else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    } else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    } else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    } else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    } else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return  result;
}

+ (NSTimeInterval)mm_getIntervalTimeCompareCurrentTime:(NSInteger)timeStamp {
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDate *currentDate = [NSDate date];
    //计算时间差值
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:confromTimesp];
    return timeInterval;
}

+ (NSTimeInterval )mm_getIntervalWithDate:(NSString *)date_smal withBigDate:(NSString *)date_big withFromat:(cDateFormatterStringKey)format {
    shareFormatter.locale = [NSLocale currentLocale];
    shareFormatter.timeZone = [NSTimeZone localTimeZone];
    shareFormatter.dateFormat = format;
    NSDate * date_big_d = [shareFormatter dateFromString:date_big];
    NSDate * date_lit = [shareFormatter dateFromString:date_smal];
    NSTimeInterval timeInterval = [date_big_d timeIntervalSinceDate:date_lit];
    return timeInterval;
}
@end
