//
//  UIButton+BAUIKit.h
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

#import <UIKit/UIKit.h>

@interface UIButton (BAUIKit)

#pragma mark - Title

@property(strong, nonatomic, nullable) NSString *normalTitle;
@property(strong, nonatomic, nullable) NSString *highlightedTitle;
@property(strong, nonatomic, nullable) NSString *selectedTitle;
@property(strong, nonatomic, nullable) NSString *disabledTitle;

#pragma mark - Title color

@property(strong, nonatomic, nullable) UIColor *normalTitleColor;
@property(strong, nonatomic, nullable) UIColor *highlightedTitleColor;
@property(strong, nonatomic, nullable) UIColor *selectedTitleColor;
@property(strong, nonatomic, nullable) UIColor *disabledTitleColor;

#pragma mark - Title shadow color

@property(strong, nonatomic, nullable) UIColor *normalTitleShadowColor;
@property(strong, nonatomic, nullable) UIColor *highlightedTitleShadowColor;
@property(strong, nonatomic, nullable) UIColor *selectedTitleShadowColor;
@property(strong, nonatomic, nullable) UIColor *disabledTitleShadowColor;

#pragma mark - Image

@property(strong, nonatomic, nullable) UIImage *normalImage;
@property(strong, nonatomic, nullable) UIImage *highlightedImage;
@property(strong, nonatomic, nullable) UIImage *selectedImage;
@property(strong, nonatomic, nullable) UIImage *disabledImage;

#pragma mark - Background image

@property(strong, nonatomic, nullable) UIImage *normalBackgroundImage;
@property(strong, nonatomic, nullable) UIImage *highlightedBackgroundImage;
@property(strong, nonatomic, nullable) UIImage *selectedBackgroundImage;
@property(strong, nonatomic, nullable) UIImage *disabledBackgroundImage;

#pragma mark - Background color

- (void)setNormalBackgroundColor:(nullable UIColor *)color;
- (void)setHighlightedBackgroundColor:(nullable UIColor *)color;
- (void)setSelectedBackgroundColor:(nullable UIColor *)color;
- (void)setDisabledBackgroundColor:(nullable UIColor *)color;

- (void)setBackgroundColor:(nullable UIColor *)backgroundColor 
                  forState:(UIControlState)state;

@end
