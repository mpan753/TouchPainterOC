//
//  ScribbleThumbnailView.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/29/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"

@interface ScribbleThumbnailView : UIView

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) Scribble *scribble;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *scribblePath;

@end
