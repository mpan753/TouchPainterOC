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

- (ScribbleMemento *) scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;

@end

@implementation Scribble

{
    id <Mark> _parentMark;
    id <Mark> _incrementalMark;
}

@synthesize mark = _parentMark;

- (instancetype)init {
    if (self = [super init]) {
        _parentMark = [[Stroke alloc] init];
    }
    return self;
}

- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    [self willChangeValueForKey:@"mark"];
    if (shouldAddToPreviousMark) {
        [[_parentMark lastChild] addMark:aMark];
    } else {
        [_parentMark addMark:aMark];
    }
    [self didChangeValueForKey:@"mark"];
}

- (ScribbleMemento *)scribbleMemento {
    return [self scribbleMementoWithCompleteSnapshot:YES];
}

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot {
    id <Mark> mementoMark;
    
    if (hasCompleteSnapshot) {
        mementoMark = _parentMark;
    }
    
    ScribbleMemento *scribbleMemento = [[ScribbleMemento alloc] initWithMark:mementoMark];
    
    return scribbleMemento;
}

@end
