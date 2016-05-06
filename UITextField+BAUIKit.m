//
//  UITextField+BAUIKit.m
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

#import "UITextField+BAUIKit.h"

#import <objc/runtime.h>
#import "NSObject+BAUIKit.h"

static const void *PlaceholderColorKey      = &PlaceholderColorKey;
static const void *TextEdgeInsetsKey        = &TextEdgeInsetsKey;
static const void *LeftViewEdgeInsetsKey    = &LeftViewEdgeInsetsKey;
static const void *RightViewEdgeInsetsKey   = &RightViewEdgeInsetsKey;

@implementation UITextField (BAUIKit)

#pragma mark - Load
+ (void)load {
    // The "+ load" method is called once, very early in the application life-cycle.
    // It's called even before the "main" function is called. Beware: there's no
    // autorelease pool at this point, so avoid Objective-C calls.
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceSelector:@selector(init)
                      withNewSelector:@selector(initSwizzled)];
        [self swizzleInstanceSelector:@selector(initWithCoder:)
                      withNewSelector:@selector(initWithCoderSwizzled:)];
        [self swizzleInstanceSelector:@selector(initWithFrame:)
                      withNewSelector:@selector(initWithFrameSwizzled:)];
        
        [self swizzleInstanceSelector:@selector(setPlaceholder:)
                      withNewSelector:@selector(setPlaceholderSwizzled:)];
        
        [self swizzleInstanceSelector:@selector(textRectForBounds:)
                      withNewSelector:@selector(textRectForBoundsSwizzled:)];
        
        [self swizzleInstanceSelector:@selector(placeholderRectForBounds:)
                      withNewSelector:@selector(placeholderRectForBoundsSwizzled:)];
        [self swizzleInstanceSelector:@selector(editingRectForBounds:)
                      withNewSelector:@selector(editingRectForBoundsSwizzled:)];
        [self swizzleInstanceSelector:@selector(leftViewRectForBounds:)
                      withNewSelector:@selector(leftViewRectForBoundsSwizzled:)];
        [self swizzleInstanceSelector:@selector(rightViewRectForBounds:)
                      withNewSelector:@selector(rightViewRectForBoundsSwizzled:)];
    });
}

#pragma mark - Private

- (void)_commonInit {
    self.textEdgeInsets = UIEdgeInsetsZero;
    self.leftViewEdgeInsets = UIEdgeInsetsZero;
    self.rightViewEdgeInsets = UIEdgeInsetsZero;
}

- (void)_udatePlaceholder {
    NSString *currentPlaceholder = self.placeholder;
    UIColor *currentPlaceholderColor = self.placeholderColor;
    
    if ([self respondsToSelector:@selector(attributedPlaceholder)]) {
        if (currentPlaceholder && currentPlaceholderColor) {
            NSDictionary *attibutes = nil;
            attibutes = @{NSForegroundColorAttributeName: currentPlaceholderColor};
            self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:currentPlaceholder 
                                                                         attributes:attibutes];
        }
    } 
    else { // for pre-iOS6
        [self setValue:currentPlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
}

#pragma mark - Properties

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    objc_setAssociatedObject(self, PlaceholderColorKey, placeholderColor, 
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self _udatePlaceholder];
}

- (UIColor *)placeholderColor {
    return objc_getAssociatedObject(self, PlaceholderColorKey);
}

- (UIEdgeInsets)textEdgeInsets {
    return [objc_getAssociatedObject(self, TextEdgeInsetsKey) UIEdgeInsetsValue];
}

- (void)setTextEdgeInsets:(UIEdgeInsets)textEdgeInsets {
    objc_setAssociatedObject(self, TextEdgeInsetsKey, 
                             [NSValue valueWithUIEdgeInsets:textEdgeInsets], 
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)leftViewEdgeInsets {
    return [objc_getAssociatedObject(self, LeftViewEdgeInsetsKey) UIEdgeInsetsValue];
}

- (void)setLeftViewEdgeInsets:(UIEdgeInsets)leftViewEdgeInsets {
    objc_setAssociatedObject(self, LeftViewEdgeInsetsKey, 
                             [NSValue valueWithUIEdgeInsets:leftViewEdgeInsets], 
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)rightViewEdgeInsets {
    return [objc_getAssociatedObject(self, RightViewEdgeInsetsKey) UIEdgeInsetsValue];
}

- (void)setRightViewEdgeInsets:(UIEdgeInsets)rightViewEdgeInsets {
    objc_setAssociatedObject(self, RightViewEdgeInsetsKey, 
                             [NSValue valueWithUIEdgeInsets:rightViewEdgeInsets], 
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Swizzled methods

- (id)initSwizzled {
    id result = [self initSwizzled];
    if (result) {
        [result _commonInit];
    }
    return result;
}

- (id)initWithCoderSwizzled:(NSCoder *)aDecoder {
    id result = [self initWithCoderSwizzled:aDecoder];
    if (result) {
        [result _commonInit];
    }
    return result;
}

- (id)initWithFrameSwizzled:(CGRect)aFrame {
    id result = [self initWithFrameSwizzled:aFrame];
    if (result) {
        [result _commonInit];
    }
    return result;
}

- (void)setPlaceholderSwizzled:(NSString *)placeholder {
    // Forward to primary implementation.
    [self setPlaceholderSwizzled:placeholder];
    
    [self _udatePlaceholder];
}

- (CGRect)textRectForBoundsSwizzled:(CGRect)bounds {
    return [self textRectForBoundsSwizzled:UIEdgeInsetsInsetRect(bounds, self.textEdgeInsets)];
}

- (CGRect)editingRectForBoundsSwizzled:(CGRect)bounds {
    return [self editingRectForBoundsSwizzled:UIEdgeInsetsInsetRect(bounds, self.textEdgeInsets)];
}

- (CGRect)placeholderRectForBoundsSwizzled:(CGRect)bounds {
    return [self placeholderRectForBoundsSwizzled:UIEdgeInsetsInsetRect(bounds, self.textEdgeInsets)];
}

- (CGRect)rightViewRectForBoundsSwizzled:(CGRect)bounds {
    CGRect rect = [self rightViewRectForBoundsSwizzled:bounds];
    rect.origin.x += self.rightViewEdgeInsets.right;
    rect.origin.y += self.rightViewEdgeInsets.top;
    return rect;
}

- (CGRect)leftViewRectForBoundsSwizzled:(CGRect)bounds {
    CGRect rect = [self leftViewRectForBoundsSwizzled:bounds];
    rect.origin.x += self.leftViewEdgeInsets.left;
    rect.origin.y += self.leftViewEdgeInsets.top;
    return rect;
}

@end
