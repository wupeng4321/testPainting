//
//  Theme.h
//  testPainting
//
//  Created by wupeng on 2017/1/29.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kColorLightGray                         0xd1d1d1
#define UIColorFromRGB(rgbValue)    [UIColor \
                                        colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                               green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                                blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kScreenWidth                    [UIScreen mainScreen].bounds.size.width

#define kDeviceScaleFactor              (kScreenWidth/375.0)


@interface Theme : NSObject
    
+ (UIColor *)colorLightGray;
    
+ (CGFloat)paddingWithSize:(CGFloat)size;

@end
