//
//  UISearchBar+BAUIKit.m
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

#import "UISearchBar+BAUIKit.h"

#import "UITextField+BAUIKit.h"
#import "UIView+BAUIKit.h"

@implementation UISearchBar (BAUIKit)

#pragma mark - Private
- (UITextField *)_getTextField {
    return [self valueForKey:@"_searchField"];
}

#pragma mark - Properties

- (UIColor *)textBorderColor {
    return [self _getTextField].borderColor;
}

- (void)setTextBorderColor:(UIColor *)borderColor {
    [self _getTextField].borderColor = borderColor;
}

- (CGFloat)textBorderWidth {
    return [self _getTextField].borderWidth;
}

- (void)setTextBorderWidth:(CGFloat)textBorderWidth {
    [self _getTextField].borderWidth = textBorderWidth;
}

- (CGFloat)textCornerRadius {
    return [self _getTextField].cornerRadius;
}

- (void)setTextCornerRadius:(CGFloat)textCornerRadius {
    [self _getTextField].cornerRadius = textCornerRadius;
}

- (UIColor *)placeholderTextColor {
    return [self _getTextField].placeholderColor;
}

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor {
    [self _getTextField].placeholderColor = placeholderTextColor;
}

- (UIColor *)placeholderBackgroundColor {
    return [self _getTextField].backgroundColor;
}

- (void)setPlaceholderBackgroundColor:(UIColor *)placeholderBackgroundColor {
    [self _getTextField].backgroundColor = placeholderBackgroundColor;
}

- (UIFont *)textFont {
    return [self _getTextField].font;
}

- (void)setTextFont:(UIFont *)textFont {
    [self _getTextField].font = textFont;
}

- (UIColor *)textColor {
    return [self _getTextField].textColor;
}

- (void)setTextColor:(UIColor *)textColor {
    [self _getTextField].textColor = textColor;
}

@end
