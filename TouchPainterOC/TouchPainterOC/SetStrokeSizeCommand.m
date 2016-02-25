//
//  SetStrokeSizeCommand.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "SetStrokeSizeCommand.h"
#import "CanvasViewController.h"
#import "CoordinatingViewController.h"

@implementation SetStrokeSizeCommand

- (void)execute {
    CGFloat strokeSize = 1;
    [self.delegate command:self didRequestForStrokeSize:&strokeSize];
    CanvasViewController *controller = [[CoordinatingViewController sharedCoordinator] canvasViewController];
    [controller setStrokeSize:strokeSize];
}

@end
