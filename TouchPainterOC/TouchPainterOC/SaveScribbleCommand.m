//
//  SaveScribbleCommand.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/26/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "SaveScribbleCommand.h"
#import "ScribbleManager.h"
#import "CoordinatingViewController.h"
#import "UIView+UIImage.h"

@implementation SaveScribbleCommand

- (void)execute {
    Scribble *scribble = [[[CoordinatingViewController sharedCoordinator] canvasViewController] scribble];
    UIImage *image = [[[[CoordinatingViewController sharedCoordinator] canvasViewController] canvasView] image];
    ScribbleManager *scribbleManager = [[ScribbleManager alloc] init];
    [scribbleManager saveScribble:scribble thumbnail:image];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Your scribble is saved" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:alertAction];
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alertController animated:YES completion:nil];
}

@end
