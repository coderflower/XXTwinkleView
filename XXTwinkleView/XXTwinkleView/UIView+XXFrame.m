//
//  UIView+Frame.h
//  Category
//
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "UIView+XXFrame.h"

@implementation UIView (XXFrame)

- (CGFloat)cf_centerX {
    
    return self.center.x;
}

- (void)setCf_centerX:(CGFloat)cf_centerX {
    
    CGPoint center = self.center;
    center.x = cf_centerX;
    self.center = center;
}

- (CGFloat)cf_centerY {
    return self.center.y;
}
- (void)setCf_centerY:(CGFloat)cf_centerY {
    
    CGPoint center = self.center;
    center.y = cf_centerY;
    self.center = center;
}

- (CGFloat)cf_height {
    
    return self.frame.size.height;
}

- (void)setCf_height:(CGFloat)cf_height {
 
    CGRect rect = self.frame;
    rect.size.height = cf_height;
    self.frame = rect;
}

- (CGFloat)cf_width {
    
    return self.frame.size.width;
}

- (void)setCf_width:(CGFloat)cf_width {
    
    CGRect rect = self.frame;
    rect.size.width = cf_width;
    self.frame = rect;
}

- (CGFloat)cf_x {
    
    return self.frame.origin.x;
}

- (void)setCf_x:(CGFloat)cf_x {
    
    CGRect rect = self.frame;
    rect.origin.x = cf_x;
    self.frame = rect;

}

- (CGFloat)cf_y {
    
    return self.frame.origin.y;
}
- (void)setCf_y:(CGFloat)cf_y {
    
    CGRect rect = self.frame;
    rect.origin.y = cf_y;
    self.frame = rect;

}

- (CGFloat)cf_maxX {
    
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)cf_maxY {
    
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)cf_midX {
    
    return self.cf_maxX - (self.cf_width / 2.f);
}

- (CGFloat)cf_midY {
    
    return self.cf_maxY - (self.cf_height / 2.f);
}

- (CGFloat)cf_minX {
    
    return CGRectGetMinX(self.frame);
}
- (CGFloat)cf_minY {
    
    return CGRectGetMinY(self.frame);
}

@end


@implementation UIScrollView (XXExtension)
#pragma mark Content Offset

- (CGFloat)contentOffsetX {
    
    return self.contentOffset.x;
}

- (CGFloat)contentOffsetY {
    
    return self.contentOffset.y;
}

- (void)setContentOffsetX:(CGFloat)newContentOffsetX {
    
    self.contentOffset = CGPointMake(newContentOffsetX, self.contentOffsetY);
}

- (void)setContentOffsetY:(CGFloat)newContentOffsetY {
    
    self.contentOffset = CGPointMake(self.contentOffsetX, newContentOffsetY);
}


#pragma mark Content Size

- (CGFloat)contentSizeWidth {
    
    return self.contentSize.width;
}

- (CGFloat)contentSizeHeight {
    
    return self.contentSize.height;
}

- (void)setContentSizeWidth:(CGFloat)newContentSizeWidth {
    
    self.contentSize = CGSizeMake(newContentSizeWidth, self.contentSizeHeight);
}

- (void)setContentSizeHeight:(CGFloat)newContentSizeHeight {
    
    self.contentSize = CGSizeMake(self.contentSizeWidth, newContentSizeHeight);
}


#pragma mark Content Inset

- (CGFloat)contentInsetTop {
    
    return self.contentInset.top;
}

- (CGFloat)contentInsetRight {
    
    return self.contentInset.right;
}

- (CGFloat)contentInsetBottom {
    
    return self.contentInset.bottom;
}

- (CGFloat)contentInsetLeft {
    
    return self.contentInset.left;
}

- (void)setContentInsetTop:(CGFloat)newContentInsetTop {
    
    UIEdgeInsets newContentInset = self.contentInset;
    newContentInset.top = newContentInsetTop;
    self.contentInset = newContentInset;
}

- (void)setContentInsetRight:(CGFloat)newContentInsetRight {
    
    UIEdgeInsets newContentInset = self.contentInset;
    newContentInset.right = newContentInsetRight;
    self.contentInset = newContentInset;
}

- (void)setContentInsetBottom:(CGFloat)newContentInsetBottom {
    
    UIEdgeInsets newContentInset = self.contentInset;
    newContentInset.bottom = newContentInsetBottom;
    self.contentInset = newContentInset;
}

- (void)setContentInsetLeft:(CGFloat)newContentInsetLeft {
    
    UIEdgeInsets newContentInset = self.contentInset;
    newContentInset.left = newContentInsetLeft;
    self.contentInset = newContentInset;
}

@end

