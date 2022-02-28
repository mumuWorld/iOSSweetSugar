//
//  MMFuncTool.m
//  iOSSweetSugar
//
//  Created by 杨杰 on 2022/2/28.
//  Copyright © 2022 Mumu. All rights reserved.
//

#import "MMFuncTool.h"

#ifndef NAN
static const uint32_t __nan = 0x7fc00000;
#define NAN (*(const float*) __nan)
#endif

#define YGUndefined NAN

@implementation MMFuncTool

- (void)applyLayoutPreservingOrigin:(BOOL)preserveOrigin dimensionFlexibility:(YGDimensionFlexibility)dimensionFlexibility
{
  CGSize size = CGSizeZero;
  if (dimensionFlexibility & YGDimensionFlexibilityFlexibleWidth) {
    size.width = YGUndefined;
  }
  if (dimensionFlexibility & YGDimensionFlexibilityFlexibleHeight) {
    size.height = YGUndefined;
  }
    NSLog(@"%@",size);
//  [self calculateLayoutWithSize:size];
//  YGApplyLayoutToViewHierarchy(self.view, preserveOrigin);
}

@end
