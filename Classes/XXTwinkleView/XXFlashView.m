//
//  XXFlashView.m
//  动画 Demo
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import "XXFlashView.h"
static NSTimeInterval const defaultTime = 2.0f;
static CGFloat const flashWidth = 40;
static CGFloat const centerWidth = 10;
@interface XXFlashView ()
/** 闪动的 view */
@property(nonatomic, strong) UIView *flashView;
@property(nonatomic, strong) UIView *centerView;
/** 定时器 */
@property(nonatomic, strong) NSTimer *showTimer;
@end
@implementation XXFlashView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self begigFlashAnimation];
    [self prepareTimer];
}

- (UIView *)flashView {
    if (!_flashView) {
        _flashView =  [[UIView alloc] init];
        [self addSubview:_flashView];
        _flashView.backgroundColor = [UIColor whiteColor];
        _flashView.layer.cornerRadius = flashWidth * 0.5;
        _flashView.alpha = 0;
    }
    return _flashView;
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

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.flashView.frame = CGRectMake((width - flashWidth) * 0.5, (height - flashWidth) * 0.5, flashWidth, flashWidth);
    self.centerView.frame = CGRectMake((width - centerWidth) * 0.5, (height - centerWidth) * 0.5, centerWidth, centerWidth);
}


/**
 开始动画
 */
- (void)startFlashAnimation {
    
    [self prepareTimer];
}


/**
 结束动画
 */
- (void)stopFlashAnimation {
    
    [self invalidateTimer];
}


/**
 配置定时器
 */
- (void)prepareTimer {
    
    if (self.showTimer) {
        [self invalidateTimer];
    }
    self.showTimer = [NSTimer scheduledTimerWithTimeInterval:defaultTime target:self selector:@selector(begigFlashAnimation) userInfo:nil repeats:true];
    [[NSRunLoop currentRunLoop] addTimer:self.showTimer forMode:NSDefaultRunLoopMode];
}


/**
 关闭定时器
 */
- (void)invalidateTimer {
    
    [self.showTimer invalidate];
    self.showTimer = nil;
}


/**
 核心方法
 */
-(void)begigFlashAnimation {
    // 缩放 + 透明度动画
    self.flashView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:3 animations:^{
        self.flashView.transform = CGAffineTransformMakeScale(1,1);
        self.flashView.alpha = 1.0;
        [UIView beginAnimations:@"flash" context:nil];
        [UIView setAnimationDuration:2];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        self.flashView.alpha = 0;
        [UIView commitAnimations];
    }];
}

- (void)dealloc {
    // 关闭定时器
    [self invalidateTimer];
}
@end
