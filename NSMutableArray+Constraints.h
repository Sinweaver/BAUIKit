//
//  NSMutableArray+Constraints.h
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
#import <Foundation/Foundation.h>

@interface NSMutableArray (Constraints)

- (nonnull NSArray<NSLayoutConstraint *> *)addConstraintsWithFormat:(nonnull NSString *)format
                                                            options:(NSLayoutFormatOptions)opts
                                                            metrics:(nullable NSDictionary *)metrics
                                                              views:(nonnull NSDictionary *)views;

- (nonnull NSArray<NSLayoutConstraint *> *)addConstraintsWithFormat:(nonnull NSString *)format
                                                              views:(nonnull NSDictionary *)views;

- (nonnull NSLayoutConstraint *)addConstraintWithItem:(nonnull id)view1
                                            attribute:(NSLayoutAttribute)attr1
                                            relatedBy:(NSLayoutRelation)relation
                                               toItem:(nullable id)view2
                                            attribute:(NSLayoutAttribute)attr2
                                           multiplier:(CGFloat)multiplier
                                             constant:(CGFloat)c;

- (nonnull NSLayoutConstraint *)addConstraintsCenterX:(nonnull id)view
                                               toItem:(nullable id)view2
                                           multiplier:(CGFloat)multiplier
                                             constant:(CGFloat)c;

- (nonnull NSLayoutConstraint *)addConstraintsCenterY:(nonnull id)view
                                               toItem:(nullable id)view2
                                           multiplier:(CGFloat)multiplier
                                             constant:(CGFloat)c;

@end
