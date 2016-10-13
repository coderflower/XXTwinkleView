//
//  XXMarkTwinkleView.h
//  XXTwinkleView
//
//  Created by mac on 2016/10/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXMarkTwinkleView : UIView
/** 文字颜色 */
@property(nonatomic, strong)  UIColor *textColor;
/** 文字字体 */
@property(nonatomic, strong)  UIFont *textFont;
/** 边框颜色 */
@property(nonatomic, strong) UIColor *edgeColor;
/** 边框宽度 */
@property(nonatomic, assign) CGFloat edgeWidth;

+ (instancetype)markViewWithTitle:(NSString *)title showInRight:(BOOL) isShowInRight;
@end
