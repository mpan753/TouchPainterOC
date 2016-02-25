//
//  SetStrokeColorCommand.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "SetStrokeColorCommand.h"
#import "CanvasViewController.h"
#import "CoordinatingViewController.h"

@implementation SetStrokeColorCommand

- (void)execute {
    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    
    [self.delegate command:self didRequestColorComponentsForRed:&red green:&green blue:&blue];
    
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    CanvasViewController *canvasVC = [[CoordinatingViewController sharedCoordinator] canvasViewController];
    [canvasVC setStrokeColor:color];
    
    [self.delegate command:self didFinishColorUpdateWithColor:color];
}

@end
