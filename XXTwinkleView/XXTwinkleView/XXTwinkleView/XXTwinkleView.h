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
 自定义构造方法

 @param color 闪烁点的颜色

 @return XXTwinkleView
 */
- (instancetype)initWithColor:(UIColor *)color;
/**
 开始呼吸动画
 */
- (void)startFlashAnimation;

/**
 结束呼吸动画
 */
- (void)stopFlashAnimation;
@end
