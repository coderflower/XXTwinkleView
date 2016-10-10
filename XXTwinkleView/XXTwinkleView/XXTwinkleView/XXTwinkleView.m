//
//  XXtwinkleView.m
//  XXTwinkleView
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import "XXTwinkleView.h"
static CGFloat const flashWidth = 30;
static CGFloat const centerWidth = 8;
@interface XXTwinkleView ()
/** 闪动的 view */
@property(nonatomic, strong) UIView *twinkleView;
/** 占位的 view */
@property(nonatomic, strong) UIView *centerView;
/** 动画组 */
@property(nonatomic, strong) CAAnimationGroup * groups;
@end
@implementation XXTwinkleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
//    [self startFlashAnimation];
}

- (UIView *)twinkleView {
    if (!_twinkleView) {
        _twinkleView =  [[UIView alloc] init];
        [self addSubview:_twinkleView];
        _twinkleView.backgroundColor = [UIColor whiteColor];
        _twinkleView.layer.cornerRadius = flashWidth * 0.5;
        _twinkleView.alpha = 0;
    }
    return _twinkleView;
}

- (UIView *)centerView {
    if (!_centerView) {
        _centerView =  [[UIView alloc] init];
        [self addSubview:_centerView];
        _centerView.backgroundColor = [UIColor whiteColor];
        _centerView.layer.cornerRadius = centerWidth * 0.5;
    }
    return _centerView;
}

- (CAAnimationGroup *)groups {
    if (!_groups) {
        // 缩放动画
        CABasicAnimation * scaleAnim = [CABasicAnimation animation];
        scaleAnim.keyPath = @"transform.scale";
        scaleAnim.fromValue = @0.1;
        scaleAnim.toValue = @1;
        scaleAnim.duration = 2;
        // 透明度动画
        CABasicAnimation *opacityAnim=[CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnim.fromValue= @1;
        opacityAnim.toValue= @0.1;
        opacityAnim.duration= 2;
        // 创建动画组
        _groups =[CAAnimationGroup animation];
        _groups.animations = @[scaleAnim,opacityAnim];
        _groups.removedOnCompletion = NO;
        _groups.fillMode = kCAFillModeForwards;
        _groups.duration = 2;
        _groups.repeatCount = FLT_MAX;
    }
    return _groups;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.centerView.frame = CGRectMake((width - centerWidth) * 0.5, (height - centerWidth) * 0.5, centerWidth, centerWidth);
    self.twinkleView.frame = CGRectMake((width - flashWidth) * 0.5, (height - flashWidth) * 0.5, flashWidth, flashWidth);
}

/**
 开始呼吸动画
 */
- (void)startFlashAnimation {
     [self.twinkleView.layer addAnimation:self.groups forKey:@"groups"];
}

/**
 结束呼吸动画
 */
- (void)stopFlashAnimation {
    [self.twinkleView.layer removeAllAnimations];
}
@end
