//
//  OpenScribbleCommand.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/29/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "OpenScribbleCommand.h"
#import "CoordinatingViewController.h"

@interface OpenScribbleCommand ()

@property (nonatomic, retain) id <ScribbleSource> scribbleSource;

@end

@implementation OpenScribbleCommand

- (id)initWithScribbleSource:(id<ScribbleSource>)aScribbleSource {
    if (self = [super init]) {
        self.scribbleSource = aScribbleSource;
    }
    return self;
}

- (void)execute {
    [[[CoordinatingViewController sharedCoordinator] canvasViewController] setScribble:[self.scribbleSource scribble]];
    [[CoordinatingViewController sharedCoordinator] requestViewChangeByObject:self];
}

@end
