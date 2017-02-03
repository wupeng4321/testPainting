//
//  testUIBezierPathView.m
//  testPainting
//
//  Created by wupeng on 2017/1/29.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "testUIBezierPathView.h"
#define transformRadian(angle) ((angle) * M_PI / 180.0)
#define ATAppTheme Theme

@implementation testUIBezierPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //set line color
    [[ATAppTheme colorLightGray] set];
//    [[UIColor redColor] set];
    CGFloat padding = 0.3;
    CGFloat totalHeight = [ATAppTheme paddingWithSize:236] - padding * 2;
    CGFloat totalWidth  = kScreenWidth - [ATAppTheme paddingWithSize:28] * 2 - padding * 2;
    CGFloat radius = [ATAppTheme paddingWithSize:12];
    CGFloat upHeight = [ATAppTheme paddingWithSize:162] - padding;
    CGFloat smallRadius = [ATAppTheme paddingWithSize:4];
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 0.5;
    aPath.lineCapStyle = kCGLineCapRound;
    aPath.lineJoinStyle = kCGLineCapRound;
    [aPath moveToPoint:CGPointMake(padding, smallRadius + padding)];
    [aPath addLineToPoint:CGPointMake(padding, upHeight - radius)];
    //1
    [aPath addArcWithCenter:CGPointMake(padding, upHeight)
                     radius:radius
                 startAngle:transformRadian(-90.0)
                   endAngle:(transformRadian(90.0))
                  clockwise:YES];
    [aPath addLineToPoint:CGPointMake(padding, totalHeight - smallRadius + padding)];
    //2
    [aPath addArcWithCenter:CGPointMake(smallRadius + padding, totalHeight - smallRadius + padding)
                     radius:smallRadius startAngle:transformRadian(180)
                   endAngle:transformRadian(90)
                  clockwise:NO];
    [aPath addLineToPoint:CGPointMake(totalWidth - smallRadius + padding, totalHeight + padding)];
    //3
    [aPath addArcWithCenter:CGPointMake(totalWidth - smallRadius + padding, totalHeight - smallRadius + padding)
                     radius:smallRadius startAngle:transformRadian(90)
                   endAngle:transformRadian(0)
                  clockwise:NO];
    [aPath addLineToPoint:CGPointMake(totalWidth + padding, upHeight + radius)];
    //    4
    [aPath addArcWithCenter:CGPointMake(totalWidth + padding, upHeight)
                     radius:radius
                 startAngle:(transformRadian(90))
                   endAngle:transformRadian(-90)
                  clockwise:YES];
    [aPath addLineToPoint:CGPointMake(totalWidth + padding, smallRadius + padding)];
    //    5
    [aPath addArcWithCenter:CGPointMake(totalWidth - smallRadius + padding, smallRadius + padding)
                     radius:smallRadius startAngle:transformRadian(0)
                   endAngle:transformRadian(-90)
                  clockwise:NO];
    [aPath addLineToPoint:CGPointMake(smallRadius + padding, padding)];
    //    6
    [aPath addArcWithCenter:CGPointMake(smallRadius + padding, smallRadius + padding)
                     radius:smallRadius startAngle:transformRadian(-90)
                   endAngle:transformRadian(-180)
                  clockwise:NO];
    [aPath moveToPoint:CGPointMake([ATAppTheme paddingWithSize:36] + padding, upHeight)];
    [self addDottedLineToPoint:CGPointMake(totalWidth + padding - [ATAppTheme paddingWithSize:36], upHeight) withPath:aPath scaleOfDottedLineToLine:2];
    
    [aPath closePath];
    //    set background color
    [[UIColor whiteColor] setFill];
    [aPath fill];
    
    UIBezierPath* bPath = [UIBezierPath bezierPath];
    [[ATAppTheme colorLightGray] set];
    bPath.lineWidth = 0.5f;
    [bPath moveToPoint:CGPointMake([ATAppTheme paddingWithSize:36] + padding, upHeight)];
    [self addDottedLineToPoint:CGPointMake(totalWidth + padding - [ATAppTheme paddingWithSize:36], upHeight) withPath:bPath scaleOfDottedLineToLine:2];
    [aPath appendPath:bPath];
    [aPath stroke];

}

- (void)addDottedLineToPoint:(CGPoint)point withPath:(UIBezierPath*)path scaleOfDottedLineToLine:(CGFloat)scale{
    path.lineWidth = 0.25;
    CGPoint currentPoint = path.currentPoint;
    CGFloat width = [self lineOfPointToPoint:currentPoint endPoint:point];
    CGFloat dattedWidth = 2;
    CGFloat lineWidth = dattedWidth * scale;
    NSInteger number = floorf((width - lineWidth) / (dattedWidth + lineWidth));
    for (NSInteger i = 0; i <= number ; i++) {
        [path addLineToPoint:CGPointMake(currentPoint.x + lineWidth, currentPoint.y)];
        [path moveToPoint:CGPointMake(currentPoint.x + lineWidth + dattedWidth, currentPoint.y)];
        currentPoint = path.currentPoint;
        [path stroke];
    }
}


- (CGFloat)lineOfPointToPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    return sqrt((pow(endPoint.x - startPoint.x, 2) + pow(endPoint.y - startPoint.y, 2)));
    
}



@end
