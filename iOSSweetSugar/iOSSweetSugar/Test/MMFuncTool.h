//
//  MMFuncTool.h
//  iOSSweetSugar
//
//  Created by 杨杰 on 2022/2/28.
//  Copyright © 2022 Mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSInteger, YGDimensionFlexibility) {
  YGDimensionFlexibilityFlexibleWidth = 1 << 0,
  YGDimensionFlexibilityFlexibleHeight = 1 << 1,
};

@interface MMFuncTool : NSObject

- (void)applyLayoutPreservingOrigin:(BOOL)preserveOrigin dimensionFlexibility:(YGDimensionFlexibility)dimensionFlexibility;
@end

NS_ASSUME_NONNULL_END
