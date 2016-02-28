//
//  ScribbleMemento.m
//  TouchPainterOC
//
//  Created by Mia on 2/27/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"

@interface ScribbleMemento ()

@property (nonatomic, strong) id<Mark> mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot;

@end

@implementation ScribbleMemento

- (instancetype) initWithMark:(id <Mark>)aMark {
    if (self = [super init]) {
        self.mark = aMark;
    }
    return self;
}

@end
