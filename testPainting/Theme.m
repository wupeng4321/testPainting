//
//  Theme.m
//  testPainting
//
//  Created by wupeng on 2017/1/29.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "Theme.h"




@implementation Theme
    
+ (UIColor *)colorLightGray{
    return UIColorFromRGB(kColorLightGray);
}
    
+ (CGFloat)paddingWithSize:(CGFloat)size{
    return (size / 2) * kDeviceScaleFactor;
}


@end
