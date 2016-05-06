//
//  NSMutableArray+Constraints.m
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

#import "NSMutableArray+Constraints.h"

@implementation NSMutableArray (Constraints)

- (NSArray<NSLayoutConstraint *> *)addConstraintsWithFormat:(NSString *)format
                                                    options:(NSLayoutFormatOptions)opts
                                                    metrics:(NSDictionary *)metrics
                                                      views:(NSDictionary *)views {
    
    NSArray<NSLayoutConstraint *> *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                                         options:opts
                                                                                         metrics:metrics
                                                                                           views:views];
    [self addObjectsFromArray:constraints];
    
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)addConstraintsWithFormat:(NSString *)format
                                                      views:(NSDictionary *)views {
    
    NSArray<NSLayoutConstraint *> *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                                         options:0
                                                                                         metrics:nil
                                                                                           views:views];
    [self addObjectsFromArray:constraints];
    
    return constraints;
}

- (NSLayoutConstraint *)addConstraintWithItem:(id)view1
                                    attribute:(NSLayoutAttribute)attr1
                                    relatedBy:(NSLayoutRelation)relation
                                       toItem:(nullable id)view2
                                    attribute:(NSLayoutAttribute)attr2
                                   multiplier:(CGFloat)multiplier
                                     constant:(CGFloat)c {
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view1
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view2
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:0.5
                                                                   constant:0];
    
    [self addObject:constraint];
    
    return constraint;
}

- (NSLayoutConstraint *)addConstraintsCenterX:(id)view
                                       toItem:(nullable id)view2
                                   multiplier:(CGFloat)multiplier
                                     constant:(CGFloat)c {
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view2
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:multiplier
                                                                   constant:c];
    [self addObject:constraint];
    
    return constraint;
}

- (NSLayoutConstraint *)addConstraintsCenterY:(id)view
                                       toItem:(nullable id)view2
                                   multiplier:(CGFloat)multiplier
                                     constant:(CGFloat)c {
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view2
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:multiplier
                                                                   constant:c];
    [self addObject:constraint];
    
    return constraint;
}

@end
