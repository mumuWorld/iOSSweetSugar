//
//  NSURL+Tools.h
//  iOSSweetSugar
//
//  Created by yangjie on 2019/4/24.
//  Copyright © 2019 Mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Tools)
/**
 URL 编码
 */
+ (NSURL *)mm_encodeUrlWithString:(NSString *)string;
/**
 URL 编码
 @return String
 */
+ (NSString *)mm_encodeUrlStringWithString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
