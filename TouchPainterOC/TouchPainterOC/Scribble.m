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

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;

@end

@implementation Scribble

{
    id <Mark> _parentMark;
    id <Mark> _incrementalMark;
}

@synthesize mark = _parentMark;

+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)aMemento {
    Scribble *scribble = [[Scribble alloc] initWithMemento:aMemento];
    return scribble;
}

- (instancetype)init {
    if (self = [super init]) {
        _parentMark = [[Stroke alloc] init];
    }
    return self;
}

- (instancetype) initWithMemento:(ScribbleMemento*)aMemento {
    if (self = [super init]) {
        if ([aMemento hasCompleteSnapshot]) {
            self.mark = aMemento.mark;
        } else {
            _parentMark = [[Stroke alloc] init];
            [self attachStateFromMemento:aMemento];
        }
    }
    return self;
}

- (void) attachStateFromMemento:(ScribbleMemento *)memento {
    [self addMark:memento.mark shouldAddToPreviousMark:NO];
}

- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    [self willChangeValueForKey:@"mark"];
    if (shouldAddToPreviousMark) {
        [[_parentMark lastChild] addMark:aMark];
    } else {
        [_parentMark addMark:aMark];
        _incrementalMark = aMark;
    }
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)aMark {
    if (aMark == _parentMark) {
        return;
    }
    [self willChangeValueForKey:@"mark"];
    [_parentMark removeMark:aMark];
    
    if (_incrementalMark == aMark) {
        _incrementalMark = nil;
    }
    [self didChangeValueForKey:@"mark"];
}

- (ScribbleMemento *)scribbleMemento {
    return [self scribbleMementoWithCompleteSnapshot:YES];
}

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot {
    id <Mark> mementoMark = _incrementalMark;
    
    if (hasCompleteSnapshot) {
        mementoMark = _parentMark;
    }
    
    ScribbleMemento *scribbleMemento = [[ScribbleMemento alloc] initWithMark:mementoMark];
    
    return scribbleMemento;
}

@end
