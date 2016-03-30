//
//  Stroke.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "Stroke.h"

@implementation Stroke

@synthesize color, size;
@dynamic location;

- (NSMutableArray *)children {
    if (!_children) {
        _children = [@[] mutableCopy];
    }
    return _children;
}

//- (instancetype)init {
//    if (self = [super init]) {
//        self.children = [@[] mutableCopy];
//    }
//    return self;
//}

- (void)addMark:(id<Mark>)mark {
    [self.children addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    if ([self.children containsObject:mark]) {
        [self.children removeObject:mark];
    } else {
        [self.children makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)lastChild {
    return [self.children lastObject];
}

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    for (id <Mark>child in self.children) {
        [child acceptMarkVisitor:visitor];
    }
    [visitor visitStroke:self];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.color = [aDecoder decodeObjectForKey:@"StrokeColor"];
        self.size = [aDecoder decodeFloatForKey:@"StrokeSize"];
        self.children = [aDecoder decodeObjectForKey:@"StrokeChildren"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:color forKey:@"StrokeColor"];
    [aCoder encodeFloat:size forKey:@"StrokeSize"];
    [aCoder encodeObject:self.children forKey:@"StrokeChildren"];
}

@end
