//
//  UIViewController+XXCommonNavBar.m
//  XXTwinkleView
//
//  Created by 花菜ChrisCai on 2016/10/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIView+XXFrame.h"
#import "UIViewController+XXCommonNavBar.h"
#import <objc/runtime.h>

@implementation UIViewController (XXCommonNavBar)
- (XXCommonNavigationBar *)cf_commonNavigationBarShowBackItem:(BOOL)isShowBackItem {
    
    XXCommonNavigationBar * bar = [XXCommonNavigationBar barBackItemShow:isShowBackItem];
    [self.view addSubview:bar];
    [self.view bringSubviewToFront:bar];
    self.navigationController.navigationBar.hidden = YES;
    return bar;
}
@end



static CGFloat const kItemMargin = 0;

@interface XXCommonNavigationBar ()
/** 是否显示返回按钮 */
@property(nonatomic, assign,getter=isShowBackItem) BOOL showBackItem;
/** 返回按钮 */
@property(nonatomic, strong) UIButton *backButton;
@end
@implementation XXCommonNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self seutupSubviews];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
+ (instancetype)barBackItemShow:(BOOL)isShow {
    XXCommonNavigationBar * bar = [[XXCommonNavigationBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    bar.backButton.hidden = NO;
    return bar;
}


- (void)seutupSubviews {
    [self addSubview:self.backImageView];
}

//- (void)setShowBackItem:(BOOL)showBackItem {
//    _showBackItem = showBackItem;
//    if (showBackItem) {
//        [self.leftButton removeFromSuperview];
//        [self.leftButtons makeObjectsPerformSelector:@selector(removeFromSuperview)];
//        self.leftButtons = nil;
//        self.backButton.hidden = NO;
//    }else {
////        self.backButton.hidden = YES;
//    }
//}


- (void)setTitle:(NSString *)title {
    _title = title;
    UILabel * label = [[UILabel alloc]init];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:16];
    [label sizeToFit];
    [self addSubview:label];
    label.frame = CGRectMake((self.cf_width - label.cf_width) * 0.5 , (64 - label.cf_height) * 0.5 + 10, label.cf_width, label.cf_height);
}

- (void)setLeftButton:(UIButton *)leftButton {
    [self addSubview:leftButton];
    if (_backButton) {
        [_backButton removeFromSuperview];
    }
    leftButton.frame = CGRectMake(kItemMargin, 20, leftButton.cf_width, 44);
}

- (void)setRightButton:(UIButton *)rightButton {
    if (self.rightButtons) {
        [self.rightButtons makeObjectsPerformSelector:@selector(removeFromSuperview)];
        self.rightButtons = nil;
    }
    [self addSubview:rightButton];
    rightButton.frame = CGRectMake(self.cf_width - rightButton.cf_width - kItemMargin, 20, rightButton.cf_width, 44);
}

- (void)setRightButtons:(NSArray<UIButton *> *)rightButtons {
    if (self.rightButtons.count) {
        [self.rightButtons makeObjectsPerformSelector:@selector(removeFromSuperview)];
        self.rightButtons = nil;
    }
    if (self.rightButton) {
        [self.rightButton removeFromSuperview];
        self.rightButton = nil;
    }
    _rightButtons = rightButtons;
    NSInteger index = 0;
    CGFloat btnX = 0;
    CGFloat btnY = 20;
    for (UIButton * button in rightButtons) {
        [self addSubview:button];
        btnX = self.cf_width - button.cf_width - kItemMargin;
        if (index != 0) {
            UIButton *lastButton = rightButtons[index - 1];
            btnX = lastButton.cf_minX - kItemMargin - button.cf_width;
        }
        button.frame = CGRectMake(btnX, btnY, button.cf_width, button.cf_height);
        index++;
    }
}


/**
 占位
 
 @param leftButtons 待实现
 */
- (void)setLeftButtons:(NSArray<UIButton *> *)leftButtons {
    if (_backButton) {
        [_backButton removeFromSuperview];
    }
}
- (void)backButtonClick {
    [[self cf_viewController].navigationController popViewControllerAnimated:YES];
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_backButton];
        _backButton.frame = CGRectMake(0, 20, 44, 44);
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        [_backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIViewController*)cf_viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController * )nextResponder;
        }
    }
    return nil;
}


- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView =  [[UIImageView alloc] init];
        _backImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    }
    return _backImageView;
}
@end
