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
    BOOL _shouldMoveContextToDot;
}
@end

@implementation MarkRenderer

- (id)initWithCGContext:(CGContextRef)context {
    if (self = [super init]) {
        _context = context;
        _shouldMoveContextToDot = YES;
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
    if (_shouldMoveContextToDot) {
        CGContextMoveToPoint(_context, vertex.location.x, vertex.location.y);
        _shouldMoveContextToDot = NO;
    } else {
        CGContextAddLineToPoint(_context, vertex.location.x, vertex.location.y);
    }
}

- (void)visitStroke:(Stroke *)stroke {
    CGContextSetFillColorWithColor(_context, stroke.color.CGColor);
    CGContextSetLineWidth(_context, stroke.size);
    CGContextSetLineCap(_context, kCGLineCapRound);
    CGContextStrokePath(_context);
    _shouldMoveContextToDot = YES;
}

@end
