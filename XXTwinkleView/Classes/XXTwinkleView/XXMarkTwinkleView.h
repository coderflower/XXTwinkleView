//
//  XXMarkTwinkleView.h
//  XXTwinkleView
//
//  Created by mac on 2016/10/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXTwinkleView;
@interface XXMarkTwinkleView : UIView
/** 文字颜色 */
@property(nonatomic, strong)  UIColor *textColor;
/** 文字字体 */
@property(nonatomic, strong)  UIFont *textFont;
/** 边框颜色 */
@property(nonatomic, strong) UIColor *edgeColor;
/** 边框宽度 */
@property(nonatomic, assign) CGFloat edgeWidth;
/** 标签名 */
@property(nonatomic, strong) NSString *title;

/**
 快速创建 XXMarkTwinkleView

 @param title         标签名
 @param isShowInRight 是否显示在右边

 @return XXMarkTwinkleView
 */
+ (instancetype)markViewWithTitle:(NSString *)title showInRight:(BOOL) isShowInRight;

/**
  根据 twinkleView 快速创建 markView

 @param twinkleView   twinkleView
 @param isShowInRight 是否显示在右边

 @return markView
 */
- (instancetype)initWithTwinkleView:(XXTwinkleView *)twinkleView showInRight:(BOOL) isShowInRight;

- (void)setTwinkleView:(XXTwinkleView *)twinkleView showInRight:(BOOL)isShowInRight ;
/**
 开始动画
 */
- (void)startAnimation;

/**
 结束动画
 */
- (void)stopAnimation;
@end
