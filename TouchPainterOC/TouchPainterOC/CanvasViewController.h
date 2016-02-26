//
//  CanvasViewController.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"
#import "Scribble.h"
#import "CanvasViewGenerator.h"

@interface CanvasViewController : UIViewController

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

@end
