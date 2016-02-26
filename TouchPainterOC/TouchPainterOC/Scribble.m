//
//  Scribble.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"

@interface Scribble()

@property (nonatomic, strong) id <Mark> mark;

@end

@implementation Scribble

{
    id <Mark> _parentMark;
    id <Mark> _incrementalMark;
}

- (instancetype)init {
    if (self = [super init]) {
        _parentMark = [[Stroke alloc] init];
    }
    return self;
}

- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    [self willChangeValueForKey:@"mark"];
    if (!shouldAddToPreviousMark) {
        [_parentMark addMark:aMark];
    } else {
        [[_parentMark lastChild] addMark:aMark];
    }
    [self didChangeValueForKey:@"mark"];
}

@end
