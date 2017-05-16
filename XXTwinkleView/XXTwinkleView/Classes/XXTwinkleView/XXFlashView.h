//
//  XXFlashView.h
//  动画 Demo
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 使用定时器 + UIView动画实现
 */
@interface XXFlashView : UIView

/**
 开始呼吸动画
 */
- (void)startFlashAnimation;

/**
 结束呼吸动画
 */
- (void)stopFlashAnimation;
@end
