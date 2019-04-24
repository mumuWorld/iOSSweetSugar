//
//  NSURL+Tools.m
//  iOSSweetSugar
//
//  Created by yangjie on 2019/4/24.
//  Copyright © 2019 Mumu. All rights reserved.
//

#import "NSURL+Tools.h"

@implementation NSURL (Tools)

+ (NSURL *)mm_encodeUrlWithString:(NSString *)string {
    NSURL *url = [NSURL URLWithString:[self mm_encodeUrlStringWithString:string]];
    return url;
}

+ (NSString *)mm_encodeUrlStringWithString:(NSString *)string {
    //需要进行转义的 字符。
    NSString *charactersToEscape = @"!@#$^%*+,;='\"`<>()[]{}\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodedUrl = [string stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return encodedUrl;
}
@end
