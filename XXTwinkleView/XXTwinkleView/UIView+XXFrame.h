//
//  UIView+Frame.h
//  Category
//
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GKFrame)
@property CGFloat cf_width;
@property CGFloat cf_height;
@property CGFloat cf_x;
@property CGFloat cf_y;
@property CGFloat cf_centerY;
@property CGFloat cf_centerX;

- (CGFloat)cf_maxX;
- (CGFloat)cf_maxY;
- (CGFloat)cf_midX;
- (CGFloat)cf_midY;
- (CGFloat)cf_minX;
- (CGFloat)cf_minY;
@end

@interface UIScrollView (XXExtension)
// Content Offset
@property (nonatomic) CGFloat contentOffsetX;
@property (nonatomic) CGFloat contentOffsetY;

// Content Size
@property (nonatomic) CGFloat contentSizeWidth;
@property (nonatomic) CGFloat contentSizeHeight;

// Content Inset
@property (nonatomic) CGFloat contentInsetTop;
@property (nonatomic) CGFloat contentInsetLeft;
@property (nonatomic) CGFloat contentInsetBottom;
@property (nonatomic) CGFloat contentInsetRight;
@end
