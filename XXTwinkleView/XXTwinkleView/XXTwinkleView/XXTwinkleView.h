//
//  XXFlashView.h
//  XXTwinkleView
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXTwinkleView;
@protocol XXTwinkleViewDelegate <NSObject>
@optional

/**
 点击标签回调
 可以使用回调也可以直接添加tap手势
 @param twinkleView twinkleView
 @param title       标题
 */
- (void)twinkleView:(XXTwinkleView *)twinkleView didClickTitle:(NSString *)title;

@end
/**
 使用核心动画动画组实现的呼吸灯动画 
 可选需不要显示标签
 */
@interface XXTwinkleView : UIView
/** 标签标题 必须先添加标签才有值*/
@property(nonatomic, strong, readonly) NSString *title;
/** 文字颜色 必须先添加标签才有效果*/
@property(nonatomic, strong)  UIColor *textColor;
/** 文字字体 必须先添加标签才有效果 */
@property(nonatomic, strong)  UIFont *textFont;
/** 标签lable的边框颜色 必须先添加标签才有效果 */
@property(nonatomic, strong) UIColor *lableBorderColor;
/** 标签label的边框 必须先添加标签才有效果 */
@property(nonatomic, assign) CGFloat labelBorderWidth;
/** 点击标签回调代理  */
@property(nonatomic, weak) id<XXTwinkleViewDelegate> delegate;
/**
 便利构造方法

 @param color       中间原点颜色
 @param edgeColor   边框颜色
 @param circleWidth 中间原点直径
 @param edgeWidth   边框宽度

 @return XXTwinkleView 对象
 */
- (instancetype)initWithColor:(UIColor *)color
                    edgeColor:(UIColor *)edgeColor
                  circleWidth:(CGFloat)circleWidth
                    edgeWidth:(CGFloat)edgeWidth ;

/**
 便利类方法

 @param color       中间原点颜色
 @param edgeColor   边框颜色
 @param circleWidth 中间原点直径
 @param edgeWidth   边框宽度

 @return XXTwinkleView 对象
 */
+ (instancetype)twinkleViewWithColor:(UIColor *)color
                           edgeColor:(UIColor *)edgeColor
                         circleWidth:(CGFloat)circleWidth
                           edgeWidth:(CGFloat)edgeWidth ;

/**
 设置标签

 @param title         标签标题
 @param isShowInRight 是否显示在右边
 */
- (void)setTitle:(NSString *)title
     showInRight:(BOOL)isShowInRight ;

/**
 开始呼吸动画
 */
- (void)startAnimation;

/**
 结束呼吸动画
 */
- (void)stopAnimation;
@end
