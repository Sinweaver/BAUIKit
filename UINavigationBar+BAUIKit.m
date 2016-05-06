//
//  UINavigationBar+BAUIKit.m
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

#import "UINavigationBar+BAUIKit.h"

#import <objc/runtime.h>
#import "UIImage+BAUIKit.h"

static const void *TitleColorKey        = &TitleColorKey;
static const void *TitleFontKey         = &TitleFontKey;

@implementation UINavigationBar (BAUIKit)

#pragma mark - Private

- (void)_setTitleWithColor:(nullable UIColor *)titleColor
                 titleFont:(nullable UIFont *)titleFont {
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    if (titleColor) {
        [attributes setObject:titleColor forKey:NSForegroundColorAttributeName];
    }
    
    if (titleFont) {
        [attributes setObject:titleFont forKey:NSFontAttributeName];
    }
    
    if (attributes.count > 0) {
        self.titleTextAttributes = attributes;
    }
    else {
        self.titleTextAttributes = nil;
    }
}

#pragma mark - Properties

- (UIColor *)titleColor {
    return objc_getAssociatedObject(self, TitleColorKey);
}

- (void)setTitleColor:(UIColor *)titleColor {
    objc_setAssociatedObject(self, TitleColorKey, titleColor, 
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self _setTitleWithColor:titleColor titleFont:self.titleFont];
}

- (UIFont *)titleFont {
    return objc_getAssociatedObject(self, TitleFontKey);
}

- (void)setTitleFont:(UIFont *)titleFont {
    objc_setAssociatedObject(self, TitleFontKey, titleFont, 
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self _setTitleWithColor:self.titleColor titleFont:titleFont];
}

#pragma mark - Methods

- (void)setBackgroundWithColor:(nullable UIColor *)color
                   translucent:(BOOL)translucent {
    
    if (translucent) {
        self.shadowImage = [UIImage new];
        self.translucent = translucent;
        
        self.barTintColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        [self setBackgroundImage:[UIImage imageWithColor:color size:CGSizeMake(1.0, 64.0)] 
                   forBarMetrics:UIBarMetricsDefault];
    }
    else {
        [self setBackgroundImage:[[UIImage alloc] init] 
                   forBarMetrics:UIBarMetricsDefault];
        self.barTintColor = color;
    }
}

- (void)setBackgroundWithImage:(nullable UIImage *)image {
    self.shadowImage = [UIImage new];
    self.translucent = YES;
    self.barTintColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsCompact];
}

@end
