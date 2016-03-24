//
//  ScribbleThumbnailViewImageProxy.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/29/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "Command.h"
#import "ScribbleThumbnailView.h"

@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) Scribble *scribble;
@property (nonatomic, strong) Command *touchCommand;

@end
