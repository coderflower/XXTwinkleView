//
//  UIViewController+XXCommonNavBar.h
//  XXTwinkleView
//
//  Created by 花菜ChrisCai on 2016/10/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXCommonNavigationBar : UIView
/** 背景控件 */
@property(nonatomic, strong) UIImageView *backImageView;
/** 标题 */
@property(nonatomic, strong) NSString *title;
/** 左边控件 */
@property(nonatomic, strong) UIButton *leftButton;
/** 右边控件 */
@property(nonatomic, strong) UIButton *rightButton;
/** 右边多个控件时使用用 */
@property(nonatomic, strong) NSArray<UIButton *> *rightButtons;
/** 左边多个控件时使用用 */
@property(nonatomic, strong) NSArray<UIButton *> *leftButtons;
+ (instancetype)barBackItemShow:(BOOL)isShow;
@end


@interface UIViewController (XXCommonNavBar)
- (XXCommonNavigationBar *)cf_commonNavigationBarShowBackItem:(BOOL)isShowBackItem;
@end
