//
//  UIButton+BAUIKit.m
//  BAUIKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Alexander Borovikov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "UIButton+BAUIKit.h"

#import "UIImage+BAUIKit.h"

@implementation UIButton (BAUIKit)

#pragma mark - Title

- (NSString *)normalTitle {
    return [self titleForState:UIControlStateNormal];
}

- (void)setNormalTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (NSString *)highlightedTitle {
    return [self titleForState:UIControlStateHighlighted];
}

- (void)setHighlightedTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateHighlighted];
}

- (NSString *)selectedTitle {
    return [self titleForState:UIControlStateSelected];
}

- (void)setSelectedTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateSelected];
}

- (NSString *)disabledTitle {
    return [self titleForState:UIControlStateDisabled];
}

- (void)setDisabledTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateDisabled];
}

#pragma mark - Title color

- (UIColor *)normalTitleColor {
    return [self titleColorForState:UIControlStateNormal];
}

- (void)setNormalTitleColor:(UIColor *)titleColor {
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

- (UIColor *)highlightedTitleColor {
    return [self titleColorForState:UIControlStateHighlighted];
}

- (void)setHighlightedTitleColor:(UIColor *)titleColor {
    [self setTitleColor:titleColor forState:UIControlStateHighlighted];
}

- (UIColor *)selectedTitleColor {
    return [self titleColorForState:UIControlStateSelected];
}

- (void)setSelectedTitleColor:(UIColor *)titleColor
{
    [self setTitleColor:titleColor forState:UIControlStateSelected];
}

- (UIColor *)disabledTitleColor {
    return [self titleColorForState:UIControlStateDisabled];
}

- (void)setDisabledTitleColor:(UIColor *)titleColor {
    [self setTitleColor:titleColor forState:UIControlStateDisabled];
}

#pragma mark - Title shadow color

- (UIColor *)normalTitleShadowColor {
    return [self titleShadowColorForState:UIControlStateNormal];
}

- (void)setNormalTitleShadowColor:(UIColor *)titleShadowColor {
    [self setTitleShadowColor:titleShadowColor forState:UIControlStateNormal];
}

- (UIColor *)highlightedTitleShadowColor {
    return [self titleShadowColorForState:UIControlStateHighlighted];
}

- (void)setHighlightedTitleShadowColor:(UIColor *)titleShadowColor {
    [self setTitleShadowColor:titleShadowColor forState:UIControlStateHighlighted];
}

- (UIColor *)disabledTitleShadowColor {
    return [self titleShadowColorForState:UIControlStateDisabled];
}

- (UIColor *)selectedTitleShadowColor {
    return [self titleShadowColorForState:UIControlStateSelected];
}

- (void)setSelectedTitleShadowColor:(UIColor *)titleShadowColor {
    [self setTitleShadowColor:titleShadowColor forState:UIControlStateSelected];
}

- (void)setDisabledTitleShadowColor:(UIColor *)titleShadowColor {
    [self setTitleShadowColor:titleShadowColor forState:UIControlStateDisabled];
}

#pragma mark - Image
- (UIImage *)normalImage {
    return [self imageForState:UIControlStateNormal];
}

- (void)setNormalImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)highlightedImage {
    return [self imageForState:UIControlStateHighlighted];
}

- (void)setHighlightedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateHighlighted];
}

- (UIImage *)selectedImage {
    return [self imageForState:UIControlStateSelected];
}

- (void)setSelectedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateSelected];
}

- (UIImage *)disabledImage {
    return [self imageForState:UIControlStateDisabled];
}

- (void)setDisabledImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateDisabled];
}


#pragma mark - Background image
- (UIImage *)normalBackgroundImage {
    return [self backgroundImageForState:UIControlStateNormal];
}

- (void)setNormalBackgroundImage:(UIImage *)backgroundImage {
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

- (UIImage *)highlightedBackgroundImage {
    return [self backgroundImageForState:UIControlStateHighlighted];
}

- (void)setHighlightedBackgroundImage:(UIImage *)backgroundImage {
    [self setBackgroundImage:backgroundImage forState:UIControlStateHighlighted];
}

- (UIImage *)selectedBackgroundImage {
    return [self backgroundImageForState:UIControlStateSelected];
}

- (void)setSelectedBackgroundImage:(UIImage *)backgroundImage {
    [self setBackgroundImage:backgroundImage forState:UIControlStateSelected];
}

- (UIImage *)disabledBackgroundImage {
    return [self backgroundImageForState:UIControlStateDisabled];
}

- (void)setDisabledBackgroundImage:(UIImage *)backgroundImage {
    [self setBackgroundImage:backgroundImage forState:UIControlStateDisabled];
}

#pragma mark - Background color

- (void)setNormalBackgroundColor:(nullable UIColor *)color {
    [self setBackgroundColor:color forState:UIControlStateNormal];
}

- (void)setHighlightedBackgroundColor:(nullable UIColor *)color {
    [self setBackgroundColor:color forState:UIControlStateHighlighted];
}

- (void)setSelectedBackgroundColor:(nullable UIColor *)color {
    [self setBackgroundColor:color forState:UIControlStateSelected];
}

- (void)setDisabledBackgroundColor:(nullable UIColor *)color {
    [self setBackgroundColor:color forState:UIControlStateDisabled];
}

- (void)setBackgroundColor:(nullable UIColor *)backgroundColor 
                  forState:(UIControlState)state {
    
    [self setBackgroundImage:[UIImage image1x1WithColor:backgroundColor] 
                    forState:state];
}

@end
