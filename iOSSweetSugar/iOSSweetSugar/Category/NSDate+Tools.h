//
//  NSDate+Tools.h
//  iOSSweetSugar
//
//  Created by yangjie on 2019/4/24.
//  Copyright © 2019 Mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString * cDateFormatterStringKey NS_STRING_ENUM;

//yyyy-MM-dd hh:mm:ss
extern cDateFormatterStringKey const cDateFormatterTypeDefault;
//yyyy-MM-dd
extern cDateFormatterStringKey const cDateFormatterTypeShortYMD;
//@"yyyy, MM , DD" 返回一个年月日的数组
extern cDateFormatterStringKey const cDateFormatterTypeSeparateYMD;

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Tools)

/**
 通过 系统时间戳 获取 string
 */
+ (NSString *)mm_getDateString:(NSInteger)timeStamp format:(cDateFormatterStringKey)format;
+ (NSString *)mm_getDateStringUsingDate:(NSDate *)date format:(cDateFormatterStringKey)format;


/**
 通过时间获取一个数组
 */
+ (NSArray *)mm_getDataArrayUsing:(NSDate*)date format:(cDateFormatterStringKey)format;
/**
 根据系统时间戳 和 现在时间比较差值
 @param timeStamp 系统时间戳
 @return string
 */
+ (NSString *)mm_compareCurrentTime:(NSInteger)timeStamp;
/**
 根据系统时间戳 和 现在时间比较差值
 @param timeStamp 系统时间戳
 @return NSTimeInterval
 */
+ (NSTimeInterval)mm_getIntervalTimeCompareCurrentTime:(NSInteger)timeStamp;

/**
 获取字符串时间戳
 */
+ (NSString *)mm_getTimeStampWith:(NSString *)date format:(cDateFormatterStringKey)format;
/**
 返回两个时间的差值
 @param date_smal 小的时间
 @param date_big 大的时间
 */
+ (NSTimeInterval )mm_getIntervalWithDate:(NSString *)date_smal withBigDate:(NSString *)date_big withFromat:(cDateFormatterStringKey)format;
@end

NS_ASSUME_NONNULL_END
