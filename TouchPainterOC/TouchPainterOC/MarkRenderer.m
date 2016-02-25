//
//  MarkRenderer.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "MarkRenderer.h"

@interface MarkRenderer ()
{
    CGContextRef _context;
}
@end

@implementation MarkRenderer

- (id)initWithCGContext:(CGContextRef)context {
    if (self = [super init]) {
        _context = context;
    }
    return self;
}

- (void)visitMark:(id<Mark>)mark {
    
}

- (void)visitDot:(Dot *)dot {
    CGFloat x = dot.location.x;
    CGFloat y = dot.location.y;
    CGFloat side = dot.size;
    CGRect rect = CGRectMake(x, y, side, side);
    CGContextSetFillColorWithColor(_context, dot.color.CGColor);
    CGContextFillEllipseInRect(_context, rect);
}

- (void)visitVertex:(Vertex *)vertex {
    CGContextAddLineToPoint(_context, vertex.location.x, vertex.location.y);
}

- (void)visitStroke:(Stroke *)stroke {
    CGContextMoveToPoint(_context, stroke.location.x, stroke.location.y);
    for (id <Mark> mark in stroke.children) {
        [self visitMark:mark];
    }
    CGContextSetFillColorWithColor(_context, stroke.color.CGColor);
    CGContextStrokePath(_context);
}

@end
