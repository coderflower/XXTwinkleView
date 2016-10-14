//
//  XXtwinkleView.m
//  XXTwinkleView
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import "XXTwinkleView.h"
#import "UIView+XXFrame.h"
// 原点控件大小
static CGFloat const kTwinkleWidth = 20;
// label额外宽度
static CGFloat const kLabelAdditionalWidth = 22;
// 原点与标签间距
static CGFloat const kContentMargin = 5;

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
/** 标签label */
@property(nonatomic, strong) UILabel *label;
/** 标签标题 */
@property(nonatomic, strong) NSString *title;
/** 是否显示在右边 */
@property(nonatomic, assign, getter=isShowInRight) BOOL showInRight;

@end

@implementation XXTwinkleView
#pragma mark -
#pragma mark - =============== 初始化方法 ===============
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


/**
 添加到父控件就开始动画
 */
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self startAnimation];
}

#pragma mark -
#pragma mark - =============== 逻辑事件 ===============
- (void)setTitle:(NSString *)title showInRight:(BOOL)isShowInRight {
    
    self.label.text = title;
    _title = title;
    [self.label sizeToFit];
    [self addSubview:self.label];
    _showInRight = isShowInRight;
    // 强制布局
    [self layoutIfNeeded];
}
- (void)tagLableClick:(UITapGestureRecognizer *)tap {
    
    NSLog(@"%@",self.title);
    if ([self.delegate respondsToSelector:@selector(twinkleView:didClickTitle:)]) {
        [self.delegate twinkleView:self didClickTitle:self.title];
    }
}

#pragma mark -
#pragma mark - =============== 动画相关 ===============
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
#pragma mark -
#pragma mark - =============== set方法 ===============
- (void)setTextColor:(UIColor *)textColor {
    
    _textColor = textColor;
    _label.textColor = textColor;
}

- (void)setTextFont:(UIFont *)textFont {
    
    _textFont = textFont;
    _label.font = textFont;
    [_label sizeToFit];
}

- (void)setLableBorderColor:(UIColor *)lableBorderColor {
    
    _lableBorderColor = lableBorderColor;
     _label.layer.borderColor = lableBorderColor.CGColor;
}

- (void)setLabelBorderWidth:(CGFloat)labelBorderWidth {
    
    _labelBorderWidth = labelBorderWidth;
    _label.layer.borderWidth = labelBorderWidth;
    
}


#pragma mark -
#pragma mark - =============== 懒加载 ===============
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

- (UILabel *)label {
    if (!_label) {
        _label =  [[UILabel alloc]init];
        // 设置默认属性
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:15];
        _label.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.8];
        _label.layer.masksToBounds = YES;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.userInteractionEnabled = YES;
        // 添加点击事件
        [_label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagLableClick:)]];
    }
    return _label;
}


#pragma mark -
#pragma mark - =============== 布局子控件 ===============
/**
 布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    // 此处不能使用self.label,否则永远为真,因为会调用get方法
    if (_label) {
        // 上移
        self.cf_y -= self.cf_height * 0.5;
        // 设置圆角
        self.twinkleView.layer.cornerRadius = kTwinkleWidth * 0.5;
        self.edgeView.layer.cornerRadius = self.edgeWidth * 0.5;
        self.centerView.layer.cornerRadius = self.centerWidth * 0.5;
        self.label.layer.cornerRadius = self.cf_height * 0.5;
        // 给label增加额外宽度, 修改高度
        self.label.cf_width = self.label.cf_width + kLabelAdditionalWidth;
        self.label.cf_height = self.cf_height;
        // 设置控件宽高 Y坐标
        self.centerView.cf_width = self.centerWidth;
        self.centerView.cf_height = self.centerWidth;
        self.centerView.cf_y = (self.cf_height -self.centerWidth) * 0.5;
        
        self.edgeView.cf_width = self.edgeWidth;
        self.edgeView.cf_height = self.edgeWidth;
        self.edgeView.cf_y = (self.cf_height-self.edgeWidth) * 0.5;
        
        self.twinkleView.cf_width = kTwinkleWidth;
        self.twinkleView.cf_height = kTwinkleWidth;
        self.twinkleView.cf_y = (self.cf_height -kTwinkleWidth) * 0.5;
        // 标签显示在右边
        if (_showInRight) {
            self.centerView.cf_x = -self.centerWidth * 0.5;
            self.edgeView.cf_x = -self.edgeWidth * 0.5;
            self.twinkleView.cf_x = -kTwinkleWidth * 0.5;
            self.label.cf_x = self.centerView.cf_maxX + kContentMargin;
            self.cf_width = self.label.cf_maxX;
        }else {
         // 标签显示在坐标
            self.cf_width = self.label.cf_maxX + kContentMargin + self.centerWidth * 0.5;
            self.centerView.cf_x = self.cf_width -self.centerWidth * 0.5;
            self.edgeView.cf_x = self.cf_width -self.edgeWidth * 0.5;
            self.twinkleView.cf_x = self.cf_width -kTwinkleWidth * 0.5;
            // 修改自身的x
            self.cf_x = self.cf_x - self.cf_width;
        }
    
    }else {
        self.edgeView.frame = CGRectMake((self.cf_width - self.edgeWidth) * 0.5, (self.cf_height - self.edgeWidth) * 0.5, self.edgeWidth, self.edgeWidth);
        self.twinkleView.frame = self.bounds;
        self.centerView.frame = CGRectMake((self.cf_width - self.centerWidth) * 0.5, (self.cf_height - self.centerWidth) * 0.5, self.centerWidth, self.centerWidth);
        self.twinkleView.layer.cornerRadius = self.cf_width * 0.5;
        self.edgeView.layer.cornerRadius = self.edgeWidth * 0.5;
        self.centerView.layer.cornerRadius = self.centerWidth * 0.5;
    }
}


@end



