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

@end

@implementation ScribbleMemento

- (instancetype) initWithMark:(id <Mark>)aMark {
    if (self = [super init]) {
        self.mark = aMark;
    }
    return self;
}

- (NSData *)data {
    return [NSKeyedArchiver archivedDataWithRootObject:self.mark];
}

@end
