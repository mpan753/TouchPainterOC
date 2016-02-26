//
//  CanvasView.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mark.h"

@interface CanvasView : UIView

@property (nonatomic, strong) id <Mark> mark;

@end
