//
//  DeleteScribbleCommand.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/26/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "DeleteScribbleCommand.h"
#import "CoordinatingViewController.h"
#import "Scribble.h"

@implementation DeleteScribbleCommand

- (void)execute {
    Scribble *scribble = [[Scribble alloc] init];
    [[[CoordinatingViewController sharedCoordinator] canvasViewController] setScribble:scribble];
}

@end
