//
//  XXMarkTwinkleView.m
//  XXTwinkleView
//
//  Created by mac on 2016/10/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "XXMarkTwinkleView.h"
#import "XXTwinkleView.h"
#import "UIView+XXFrame.h"
// 原点控件大小
static CGFloat const kTwinkleWidth = 20;
// label额外宽度
static CGFloat const kLabelAdditionalWidth = 22;
// 原点与标签间距
static CGFloat const kContentMargin = 0;
@interface XXMarkTwinkleView ()
/** XXTwinkleView */
@property(nonatomic, strong) XXTwinkleView *twinkleView;
/** 是否显示在右边 */
@property(nonatomic, assign, getter=isShowInRight)  BOOL showInRight;
/**  标签 */
@property(nonatomic, strong) UILabel *tagLable;

@end
@implementation XXMarkTwinkleView

+ (instancetype)markViewWithTitle:(NSString *)title showInRight:(BOOL)isShowInRight {
    XXMarkTwinkleView * markView = [[XXMarkTwinkleView alloc] init];
    markView.title = title;
    markView.showInRight = isShowInRight;
    return markView;
}

- (instancetype)initWithTwinkleView:(XXTwinkleView *)twinkleView showInRight:(BOOL)isShowInRight {
    if (self = [super init]) {
        _twinkleView = twinkleView;
        [self addSubview:_twinkleView];
        [self layoutIfNeeded];
        self.showInRight = isShowInRight;
    }
    return  self;
}

- (void)startAnimation {
    [self.twinkleView startAnimation];
}

- (void)stopAnimation {
    [self.twinkleView stopAnimation];
}

#pragma mark -
#pragma mark - =============== setter方法 ===============
- (void)setTitle:(NSString *)title {
    _title = title;
    self.tagLable.text = title;
    [self.tagLable sizeToFit];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.tagLable.textColor = textColor;
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    self.tagLable.font = textFont;
}

- (void)setEdgeColor:(UIColor *)edgeColor {
    _edgeColor = edgeColor;
    self.tagLable.layer.borderColor = edgeColor.CGColor;
}

- (void)setEdgeWidth:(CGFloat)edgeWidth {
    _edgeWidth = edgeWidth;
    self.tagLable.layer.borderWidth = edgeWidth;
}

- (void)tagLableClick:(UITapGestureRecognizer *)tap {
    NSLog(@"点击了标签");
}


#pragma mark -
#pragma mark - =============== 懒加载 ===============
- (UILabel *)tagLable {
    if (!_tagLable) {
        _tagLable =  [[UILabel alloc]init];
        [self addSubview:_tagLable];
        // 设置默认属性
        _tagLable.textColor = [UIColor blackColor];
        _tagLable.font = [UIFont systemFontOfSize:15];
        _tagLable.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.8];
        _tagLable.layer.masksToBounds = YES;
        _tagLable.textAlignment = NSTextAlignmentCenter;
        _tagLable.userInteractionEnabled = YES;
        // 添加点击事件
        [_tagLable addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagLableClick:)]];
    }
    return _tagLable;
}

- (XXTwinkleView *)twinkleView {
    if (!_twinkleView) {
        _twinkleView =  [XXTwinkleView twinkleViewWithColor:[UIColor redColor] edgeColor:[UIColor whiteColor] circleWidth:8 edgeWidth:2];
        [self addSubview:_twinkleView];
    }
    return _twinkleView;
}

/**
 布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    // 下移一半以呼吸灯控件中心点Y作为坐标原点
    CGRect tmpBounds = self.bounds;
    tmpBounds.origin.y -= self.cf_height * 0.5;
    self.bounds = tmpBounds;
    // 根据标签显示的位置,布局子控件
    if (self.isShowInRight) {
        self.twinkleView.frame = CGRectMake(-kTwinkleWidth * 0.5, -kTwinkleWidth * 0.5 , kTwinkleWidth, kTwinkleWidth);
        self.tagLable.frame = CGRectMake(self.twinkleView.cf_maxX + kContentMargin, -self.cf_height * 0.5 , self.tagLable.cf_width + kLabelAdditionalWidth, self.cf_height);
        // 设置宽度
        self.cf_width = self.tagLable.cf_maxX;
    }else {
        
        self.tagLable.frame = CGRectMake(0, -self.cf_height * 0.5 , self.tagLable.cf_width + kLabelAdditionalWidth, self.cf_height);
        self.twinkleView.frame = CGRectMake(self.tagLable.cf_maxX + kContentMargin, -kTwinkleWidth * 0.5 , kTwinkleWidth, kTwinkleWidth);
        // 计算宽度
        CGFloat width = self.twinkleView.cf_minX + kTwinkleWidth * 0.5;
        self.cf_x = self.cf_x - width;
        // 修改控件位置以呼吸灯控件中心为坐标0 0,设置宽度
        self.cf_width = width ;
    }
    self.tagLable.layer.cornerRadius = self.cf_height * 0.5;
}

@end
