//
//  CoordinatingViewController.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

typedef enum
{
    kButtonTagDone,
    kButtonTagOpenPaletteView,
    kButtonTagOpenThumbnailView
} ButtonTag;

@interface CoordinatingViewController : UIViewController

+ (CoordinatingViewController *)sharedCoordinator;

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

- (IBAction) requestViewChangeByObject:(id)object;

@end
