//
//  UIImage+BAUIKit.m
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

#import "UIImage+BAUIKit.h"

#import "UIColor+BAUIKit.h"

@implementation UIImage (BAUIKit)

#pragma mark - Color
+ (nullable UIImage *)imageWithColor:(nullable UIColor *)color
                                size:(CGSize)size {
    
    if (!color || CGSizeEqualToSize(CGSizeZero, size)) {
        return nil;
    }
    
    CGRect rect = CGRectMake(0.f, 0.f, size.width, size.height);
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // background
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    // Get the image, here setting the UIImageView image
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return imageNew;
}

+ (nullable UIImage *)image1x1WithColor:(nullable UIColor *)color {
    return [[self class] imageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}

#pragma mark - Avatar
+ (nullable UIImage *)avatarImageWithText:(nullable NSString *)string
                                textColor:(nullable UIColor *)textColor
                          backgroundColor:(nullable UIColor *)backgroundColor
                              borderColor:(nullable UIColor *)borderColor
                                     font:(nullable UIFont *)font
                               borderSize:(CGFloat)borderSize
                                     size:(CGSize)size {
    
    CGFloat minSizeNew = MIN(size.width, size.height);
    CGRect avatarRect = CGRectMake((size.width - minSizeNew) / 2.0,
                                   (size.height - minSizeNew) / 2.0,
                                   minSizeNew,
                                   minSizeNew);
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:avatarRect];
    path.lineWidth = borderSize;
    
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    
    // Background
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextFillPath(context);
    
    // Text
    NSString *firstLetter = [string substringToIndex:1];
    
    NSMutableParagraphStyle *initialsStringStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    initialsStringStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *initialAttributes = @{NSFontAttributeName: font, 
                                        NSForegroundColorAttributeName: textColor, 
                                        NSParagraphStyleAttributeName: initialsStringStyle};
    
    CGFloat textHeight = [firstLetter boundingRectWithSize: CGSizeMake(avatarRect.size.width, INFINITY)  
                                                   options: NSStringDrawingUsesLineFragmentOrigin 
                                                attributes: initialAttributes 
                                                   context: nil].size.height;
    
    CGFloat y = (CGRectGetHeight(avatarRect) - textHeight) / 2.0;
    
    [firstLetter drawInRect:CGRectMake(CGRectGetMinY(avatarRect),
                                       y, 
                                       CGRectGetWidth(avatarRect), 
                                       textHeight) 
             withAttributes:initialAttributes];
    
    // Border
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextStrokePath(context); 
    
    // Get the image, here setting the UIImageView image
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return imageNew;
}

+ (nullable UIImage *)avatarImageWithImage:(nullable UIImage *)image
                               borderColor:(nullable UIColor *)borderColor
                                borderSize:(CGFloat)borderSize
                                      size:(CGSize)size {
    
    CGFloat minSizeNew = MIN(size.width, size.height);
    CGRect avatarRect = CGRectMake((size.width - minSizeNew) / 2.0,
                                   (size.height - minSizeNew) / 2.0,
                                   minSizeNew,
                                   minSizeNew);
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:avatarRect];
    path.lineWidth = borderSize;
    
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    
    // Image
    [image drawInRect:avatarRect];
    
    // Border
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextStrokePath(context); 
    
    // Get the image, here setting the UIImageView image
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return imageNew;
}

#pragma mark - Crop
- (nullable UIImage *)imageCroppedToRect:(CGRect)cropArea {
    CGRect rect = CGRectMake(-cropArea.origin.x, -cropArea.origin.y,
                             self.size.width, self.size.height);
    
    return [self _imageToRect:rect];
}

- (nullable UIImage *)imageCroppedToFill:(CGSize)size {
    CGFloat factor = MAX(size.width / self.size.width,
                         size.height / self.size.height);
    
    CGRect rect = CGRectMake((size.width - self.size.width * factor) / 2.0,
                             (size.height - self.size.height * factor) / 2.0,
                             self.size.width * factor,
                             self.size.height * factor);
    
    return [self _imageToRect:rect];
}

- (nullable UIImage *)imageDonwsizedToFill:(CGSize)size {
    CGFloat factor = MAX(size.width / self.size.width,
                         size.height / self.size.height);
    
    CGRect rect = CGRectMake(0.0, 
                             0.0, 
                             self.size.width * factor, 
                             self.size.height * factor);
    
    return [self _imageToRect:rect];
}

- (nullable UIImage *)imageDonwsizedToFit:(CGSize)size {
    CGFloat factor = MIN(size.width / self.size.width,
                         size.height / self.size.height);
    
    CGRect rect = CGRectMake(0.0, 
                             0.0, 
                             self.size.width * factor, 
                             self.size.height * factor);
    
    return [self _imageToRect:rect];
}

- (nullable UIImage *)imageDownsizedByFactor:(CGFloat)factor {
    if (factor >= 1.0)
        return self;
    
    CGRect target = CGRectMake(0.0, 
                               0.0, 
                               self.size.width * factor, 
                               self.size.height * factor);
    
    return [self _imageToRect:target];
}

- (nullable UIImage *)flipImageHorizontally {
    return [[UIImage alloc] initWithCGImage:self.CGImage scale:self.scale 
                                orientation:UIImageOrientationUpMirrored];
}

- (nullable UIImage *)flipImageVertically {
    return [[UIImage alloc] initWithCGImage:self.CGImage scale:self.scale 
                                orientation:UIImageOrientationLeftMirrored];
}

#pragma mark - Alpha
- (BOOL)hasAlpha {
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst || 
            alpha == kCGImageAlphaLast || 
            alpha == kCGImageAlphaPremultipliedFirst || 
            alpha == kCGImageAlphaPremultipliedLast);
}

#pragma mark - Private
- (nullable UIImage *)_imageToRect:(CGRect)rect {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(rect.size, YES, self.scale);
    } else {
        UIGraphicsBeginImageContext(rect.size);
    }
    
    [self drawInRect:rect];
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imageNew;
}

@end
