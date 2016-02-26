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

- (void)addMark:(id<Mark>)mark {
    [self.children addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    [self.children removeObject:mark];
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

@end
