//
//  ScribbleThumbnailView.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/29/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "ScribbleSource.h"

@interface ScribbleThumbnailView : UIView <ScribbleSource>

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) Scribble *scribble;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *scribblePath;

@end
