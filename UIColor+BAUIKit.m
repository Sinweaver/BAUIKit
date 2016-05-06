//
//  UIColor+BAUIKit.m
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

#import "UIColor+BAUIKit.h"

@implementation UIColor (BAUIKit)

#pragma mark - Color Space Model
- (CGColorSpaceModel)colorSpaceModel {
    return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (BOOL)canProvideRGBComponents {
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelRGB:
        case kCGColorSpaceModelMonochrome:
            return YES;
        default:
            return NO;
    }
}

#pragma mark - Properties
- (CGFloat)red {
    if (self.canProvideRGBComponents) {
        const CGFloat *c = CGColorGetComponents(self.CGColor);
        return c[0];
    }
    
    return 0.0;
}

- (CGFloat)green {
    if (self.canProvideRGBComponents) {
        const CGFloat *c = CGColorGetComponents(self.CGColor);
        if (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)) == kCGColorSpaceModelMonochrome)
            return c[0];
        return c[1];
    }
    
    return 0.0;
}

- (CGFloat)blue {
    if (self.canProvideRGBComponents) {
        const CGFloat *c = CGColorGetComponents(self.CGColor);
        if (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)) == kCGColorSpaceModelMonochrome)
            return c[0];
        return c[2];
    }
    
    return 0.0;
}

- (CGFloat)white {
    if (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)) == kCGColorSpaceModelMonochrome) {
        const CGFloat *c = CGColorGetComponents(self.CGColor);
        return c[0];
    }
    
    return 0.0;
}

- (CGFloat)hue {
    if (self.canProvideRGBComponents) {
        CGFloat hue, saturation, brightness, alpha;
        [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]; 
        
        return hue;
    }
    
    return 0.0;
}

- (CGFloat)saturation {
    if (self.canProvideRGBComponents) {
        CGFloat hue, saturation, brightness, alpha;
        [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
        
        return saturation;
    }
    
    return 0.0;
}

- (CGFloat)brightness {
    if (self.canProvideRGBComponents) {
        CGFloat hue, saturation, brightness, alpha;
        [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
        
        return brightness;
    }
    
    return 0.0;
}

- (CGFloat)alpha {
    return CGColorGetAlpha(self.CGColor);
}

+ (nullable UIColor *)colorWithHexString:(nullable NSString *)hexToConvert {
    return [UIColor colorWithHexString:hexToConvert alpha:1.0f];
}

+ (nullable UIColor *)colorWithHexString:(nullable NSString *)hexToConvert 
                                   alpha:(CGFloat)opacity {
    
    if (!hexToConvert) {
        return nil;
    }
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexToConvert];
    
    // Tell scanner to skip the # character
    scanner.charactersToBeSkipped = [NSCharacterSet characterSetWithCharactersInString:@"#"];
    
    // Scan hex value
    UInt32 hexInt = 0;
    if (![scanner scanHexInt:&hexInt]) {
        return nil;
    }
    
    return [UIColor colorWithRGBHex:hexInt alpha:opacity];
}

+ (nonnull UIColor *)colorWithRGBHex:(UInt32)hex 
                               alpha:(CGFloat)opacity {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:opacity];
}

+ (nonnull UIColor *)colorWithColor:(nonnull UIColor *)color
                              alpha:(CGFloat)alpha {
    return [color colorWithAlphaComponent:alpha];
}

+ (nonnull UIColor *)randomColor {
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

+ (nonnull UIColor *)randomColor2 {
    
    srand48(arc4random());
    
    float red = 0.0;
    while (red < 0.1 || red > 0.84) {
        red = drand48();
    }
    
    float green = 0.0;
    while (green < 0.1 || green > 0.84) {
        green = drand48();
    }
    
    float blue = 0.0;
    while (blue < 0.1 || blue > 0.84) {
        blue = drand48();
    }
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

- (nonnull NSString *)toHexString {
    NSAssert(self.canProvideRGBComponents, @"Must be an RGB color");
    
    CGFloat r, g, b;
    r = self.red;
    g = self.green;
    b = self.blue;
    
    if (r < 0.0f) r = 0.0f;
    if (g < 0.0f) g = 0.0f;
    if (b < 0.0f) b = 0.0f;
    if (r > 1.0f) r = 1.0f;
    if (g > 1.0f) g = 1.0f;
    if (b > 1.0f) b = 1.0f;
    
    return [NSString stringWithFormat:@"%02X%02X%02X",
            (int)(r * 255), (int)(g * 255), (int)(b * 255)];
}

@end
