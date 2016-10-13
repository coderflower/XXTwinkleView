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

static CGFloat const kTwinkleWidth = 30;
static CGFloat const kLabelAdditionalWidth = 22;
static CGFloat const kContentMargin = 5;
@interface XXMarkTwinkleView ()
/** XXTwinkleView */
@property(nonatomic, strong) XXTwinkleView *twinkleView;
/** 是否显示在右边 */
@property(nonatomic, assign, getter=isShowInRight)  BOOL showInRight;
/** 标签名 */
@property(nonatomic, strong) NSString *title;
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
        _tagLable.textColor = [UIColor yellowColor];
        _tagLable.font = [UIFont systemFontOfSize:15];
        _tagLable.layer.borderColor = self.edgeColor.CGColor;
        _tagLable.layer.borderWidth = 1;
        _tagLable.textAlignment = NSTextAlignmentCenter;
        _tagLable.userInteractionEnabled = YES;
        [_tagLable addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagLableClick:)]];
        [self addSubview:_tagLable];
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
    
    if (self.isShowInRight) {
        self.twinkleView.frame = CGRectMake(-kTwinkleWidth * 0.5, (self.cf_height - kTwinkleWidth) * 0.5 , kTwinkleWidth, kTwinkleWidth);
        self.tagLable.frame = CGRectMake(self.twinkleView.cf_maxX + kContentMargin, 0 , self.tagLable.cf_width + kLabelAdditionalWidth, self.cf_height);
        self.tagLable.layer.cornerRadius = self.cf_height * 0.5;
        self.cf_width = self.tagLable.cf_maxX;
    }else {
        CGFloat width = self.tagLable.cf_width + kLabelAdditionalWidth + kTwinkleWidth * 0.5 + kContentMargin;
        self.cf_x = self.cf_x - width;
        self.tagLable.frame = CGRectMake(0, 0 , self.tagLable.cf_width + kLabelAdditionalWidth, self.cf_height);
        self.tagLable.layer.cornerRadius = self.cf_height * 0.5;
        self.twinkleView.frame = CGRectMake(self.tagLable.cf_maxX + kContentMargin, (self.cf_height - kTwinkleWidth) * 0.5 , kTwinkleWidth, kTwinkleWidth);
        self.cf_width = self.twinkleView.cf_maxX - kTwinkleWidth * 0.5;
    }
}

@end
