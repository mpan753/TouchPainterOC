//
//  ScribbleManager.h
//  TouchPainterOC
//
//  Created by Mia on 2/27/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"

@interface ScribbleManager : NSObject

- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image;
- (NSInteger) numberOfScribbles;
- (Scribble *) scribbleAtIndex:(NSInteger)index;
- (UIView *) scribbleThumbnailViewAtIndex:(NSInteger)index;

@end
