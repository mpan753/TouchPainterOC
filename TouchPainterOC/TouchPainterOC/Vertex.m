//
//  Vertex.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "Vertex.h"

@interface Vertex ()

@end

@implementation Vertex

@synthesize location;
@dynamic color, size, lastChild;

- (id)initWithLocation:(CGPoint)loc {
    if (self = [super init]) {
        [self setLocation:loc];
    }
    return self;
}

- (void)addMark:(id<Mark>)mark {
}

- (void)removeMark:(id<Mark>)mark {
    
}

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitVertex:self];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.location = [[aDecoder decodeObjectForKey:@"VertexLocation"] CGPointValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[NSValue valueWithCGPoint:self.location] forKey:@"VertexLocation"];
}

@end
