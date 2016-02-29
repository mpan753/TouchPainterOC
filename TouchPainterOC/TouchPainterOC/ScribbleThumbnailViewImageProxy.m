//
//  ScribbleThumbnailViewImageProxy.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/29/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "ScribbleThumbnailViewImageProxy.h"

@interface ScribbleThumbnailViewImageProxy ()

//@property (nonatomic, strong) Scribble *scribble;
//@property (nonatomic, strong) UIImage *realImage;
//@property (nonatomic, assign) BOOL loadingThreadHasLaunched;

@end

@implementation ScribbleThumbnailViewImageProxy
{
    Scribble *scribble;
    UIImage *realImage;
    BOOL loadingThreadHasLaunched;
}
@synthesize scribble = _scribble, image = _realImage;

@end
