//
//  UIImage+BAUIKit.h
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

@interface UIImage (BAUIKit)

#pragma mark - Color
+ (nullable UIImage *)imageWithColor:(nullable UIColor *)color
                                size:(CGSize)size;

+ (nullable UIImage *)image1x1WithColor:(nullable UIColor *)color;

#pragma mark - Avatar
+ (nullable UIImage *)avatarImageWithText:(nullable NSString *)string
                                textColor:(nullable UIColor *)textColor
                          backgroundColor:(nullable UIColor *)backgroundColor
                              borderColor:(nullable UIColor *)borderColor
                                     font:(nullable UIFont *)font
                               borderSize:(CGFloat)borderSize
                                     size:(CGSize)size;

+ (nullable UIImage *)avatarImageWithImage:(nullable UIImage *)image
                               borderColor:(nullable UIColor *)borderColor
                                borderSize:(CGFloat)borderSize
                                      size:(CGSize)size;

#pragma mark - Crop
- (nullable UIImage *)imageCroppedToRect:(CGRect)cropArea;
- (nullable UIImage *)imageCroppedToFill:(CGSize)size;
- (nullable UIImage *)imageDonwsizedToFill:(CGSize)size;
- (nullable UIImage *)imageDonwsizedToFit:(CGSize)size;
- (nullable UIImage *)imageDownsizedByFactor:(CGFloat)factor;

#pragma mark - Flip
- (nullable UIImage *)flipImageHorizontally;
- (nullable UIImage *)flipImageVertically;

#pragma mark - Alpha
- (BOOL)hasAlpha;

@end
