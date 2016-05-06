//
//  UISegmentedControl+BAUIKit.m
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

#import "UISegmentedControl+BAUIKit.h"

#import <objc/runtime.h>

static const void *TextColorKey  = &TextColorKey;
static const void *TextFontKey   = &TextFontKey;

@implementation UISegmentedControl (BAUIKit)

- (void)setTextColor:(UIColor *)textColor {
    objc_setAssociatedObject(self, TextColorKey, textColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSDictionary *textAttributes = nil;
    
    if (textColor && self.textFont) {
        textAttributes = @{NSFontAttributeName:self.textFont, NSForegroundColorAttributeName:textColor};
    }
    else if (textColor) {
        textAttributes = @{NSForegroundColorAttributeName:textColor};
    }
    
    if (textAttributes) {
        [self setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
        [self setTitleTextAttributes:textAttributes forState:UIControlStateHighlighted];
        [self setTitleTextAttributes:textAttributes forState:UIControlStateSelected];
    }
}

- (UIColor *)textColor {
    return objc_getAssociatedObject(self, TextColorKey);
}

- (void)setTextFont:(UIFont *)textFont {
    objc_setAssociatedObject(self, TextFontKey, textFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSDictionary *textAttributes = nil;
    
    if (textFont && self.textColor) {
        textAttributes = @{NSFontAttributeName:textFont, NSForegroundColorAttributeName:self.textColor};
    }
    else if (textFont) {
        textAttributes = @{NSFontAttributeName:textFont};
    }
    
    if (textAttributes) {
        [self setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
        [self setTitleTextAttributes:textAttributes forState:UIControlStateHighlighted];
        [self setTitleTextAttributes:textAttributes forState:UIControlStateSelected];
    }
}

- (UIFont *)textFont {
    return objc_getAssociatedObject(self, TextFontKey);
}

@end
