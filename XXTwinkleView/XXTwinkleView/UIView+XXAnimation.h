//
//  UIView+XXAnimation.h
//  
//
//  Created by Caiflower on 2016/9/20.
//  Copyright © 2016年 Caiflower. All rights reserved.
//


#import <UIKit/UIKit.h>

/**
 常用动画小分类
 */
@interface UIView (XXAnimation)
/**
 *  从底部升起出现
 */
- (void)cf_showFromBottom;

/**
 *  消失降到底部
 */
- (void)cf_dismissToBottomWithCompleteBlock:(void(^)())completeBlock;

/**
 *  从透明到不透明
 */
- (void)cf_emerge;

/**
 *  从不透明到透明
 */
- (void)cf_fake;

/**
 *  按钮震动动画
 */
- (void)cf_startSelectedAnimation;
@end
