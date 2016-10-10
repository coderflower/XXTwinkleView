//
//  UIView+XXAnimation.m
//
//  Created by Caiflower on 2016/9/20.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import "UIView+XXAnimation.h"
#import <objc/runtime.h>
#define BottomRect CGRectMake(self.frame.origin.x, [[UIScreen mainScreen] bounds].size.height, self.frame.size.width, self.frame.size.height)

@implementation UIView (XXAnimation)
#pragma mark - 底部出现动画
- (void)cf_showFromBottom {
    CGRect rect = self.frame;
    self.frame = BottomRect;
    [self executeAnimationWithFrame:rect completeBlock:nil];
}

#pragma mark - 底部消失动画
- (void)cf_dismissToBottomWithCompleteBlock:(void(^)())completeBlock {
    [self executeAnimationWithFrame:BottomRect completeBlock:completeBlock];
}

#pragma mark - 背景浮现动画
- (void)cf_emerge {
    self.alpha = 0.0;
    [self executeAnimationWithAlpha:0.2 completeBlock:nil];
}

#pragma mark - 背景淡去动画
- (void)cf_fake {
    [self executeAnimationWithAlpha:0.f completeBlock:nil];
}

#pragma mark - 执行动画
- (void)executeAnimationWithAlpha:(CGFloat)alpha completeBlock:(void(^)())completeBlock{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = alpha;
    } completion:^(BOOL finished) {
        if (finished && completeBlock) completeBlock();
    }];
}

- (void)executeAnimationWithFrame:(CGRect)rect completeBlock:(void(^)())completeBlock{
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = rect;
    } completion:^(BOOL finished) {
        if (finished && completeBlock) completeBlock();
    }];
}

#pragma mark - 按钮震动动画
- (void)cf_startSelectedAnimation {
    CAKeyframeAnimation * ani = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    ani.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)],
                   [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1.0)],
                   [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)],
                   [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.duration = 0.4;
    [self.layer addAnimation:ani forKey:@"transformAni"];
}
@end
