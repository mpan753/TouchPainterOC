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

@end
