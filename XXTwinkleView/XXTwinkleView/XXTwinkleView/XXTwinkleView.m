//
//  XXtwinkleView.m
//  XXTwinkleView
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import "XXTwinkleView.h"
//static CGFloat const twinkleWidth = 30;
//static CGFloat const centerWidth = 8;
@interface XXTwinkleView ()
/** 闪动的 view */
@property(nonatomic, strong) UIView *twinkleView;
/** 占位的 view */
@property(nonatomic, strong) UIView *centerView;
/** 边框 */
@property(nonatomic, strong) UIView *edgeView;
/** 边框颜色 */
@property(nonatomic, strong) UIColor *edgeColor;
/** 边框宽度 */
@property(nonatomic, assign) CGFloat centerWidth;
/** 边框宽度 */
@property(nonatomic, assign) CGFloat edgeWidth;
/** 动画组 */
@property(nonatomic, strong) CAAnimationGroup * groups;
/** 闪烁的点颜色 */
@property(nonatomic, strong) UIColor *twinkleColor;
@end
@implementation XXTwinkleView

- (instancetype)initWithColor:(UIColor *)color edgeColor:(UIColor *)edgeColor circleWidth:(CGFloat)circleWidth edgeWidth:(CGFloat)edgeWidth {
    if (self = [super init]) {
        self.twinkleColor = color;
        self.edgeColor = edgeColor;
        self.centerWidth = circleWidth;
        self.edgeWidth = circleWidth + edgeWidth;
    }
    return self;
}
+ (instancetype)twinkleViewWithColor:(UIColor *)color edgeColor:(UIColor *)edgeColor circleWidth:(CGFloat)circleWidth edgeWidth:(CGFloat)edgeWidth {
    return [[self alloc]initWithColor:color edgeColor:edgeColor circleWidth:circleWidth edgeWidth:edgeWidth];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self startAnimation];
}

- (UIView *)twinkleView {
    if (!_twinkleView) {
        _twinkleView =  [[UIView alloc] init];
        [self addSubview:_twinkleView];
        _twinkleView.backgroundColor = self.edgeColor;
        _twinkleView.alpha = 0;
    }
    return _twinkleView;
}

- (UIView *)edgeView {
    if (!_edgeView) {
        _edgeView =  [[UIView alloc] init];
        [self addSubview:_edgeView];
        _edgeView.backgroundColor = self.edgeColor;
    }
    return _edgeView;
}

- (UIView *)centerView {
    if (!_centerView) {
        _centerView =  [[UIView alloc] init];
        [self addSubview:_centerView];
        _centerView.backgroundColor = self.twinkleColor? self.twinkleColor : [UIColor whiteColor];
        
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
    self.edgeView.frame = CGRectMake((width - self.edgeWidth) * 0.5, (height - self.edgeWidth) * 0.5, self.edgeWidth, self.edgeWidth);
    self.twinkleView.frame = self.bounds;
    self.centerView.frame = CGRectMake((width - self.centerWidth) * 0.5, (height - self.centerWidth) * 0.5, self.centerWidth, self.centerWidth);
    self.twinkleView.layer.cornerRadius = width * 0.5;
    self.edgeView.layer.cornerRadius = self.edgeWidth * 0.5;
    self.centerView.layer.cornerRadius = self.centerWidth * 0.5;
}

/**
 开始呼吸动画
 */
- (void)startAnimation {
     [self.twinkleView.layer addAnimation:self.groups forKey:@"groups"];
}

/**
 结束呼吸动画
 */
- (void)stopAnimation {
    [self.twinkleView.layer removeAllAnimations];
}
@end



