//
//  XXFlashView.h
//  XXTwinkleView
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 使用核心动画动画组实现的呼吸灯动画
 */
@interface XXTwinkleView : UIView

/**
 便利构造方法

 @param color       中间原点颜色
 @param edgeColor   边框颜色
 @param circleWidth 中间原点直径
 @param edgeWidth   边框宽度

 @return XXTwinkleView 对象
 */
- (instancetype)initWithColor:(UIColor *)color edgeColor:(UIColor *)edgeColor circleWidth:(CGFloat)circleWidth edgeWidth:(CGFloat)edgeWidth ;

+ (instancetype)twinkleViewWithColor:(UIColor *)color edgeColor:(UIColor *)edgeColor circleWidth:(CGFloat)circleWidth edgeWidth:(CGFloat)edgeWidth ;
/**
 开始呼吸动画
 */
- (void)startAnimation;

/**
 结束呼吸动画
 */
- (void)stopAnimation;
@end
