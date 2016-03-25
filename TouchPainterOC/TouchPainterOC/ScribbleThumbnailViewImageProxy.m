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
    Scribble *_scribble;
    UIImage *_realImage;
    BOOL _loadingThreadHasLaunched;
}
@synthesize scribble = _scribble, image = _realImage;

- (UIImage *)image {
    if (!_realImage) {
        _realImage = [[UIImage alloc] initWithContentsOfFile:self.imagePath];
    }
    return _realImage;
}

- (Scribble *)scribble {
    if (!_scribble) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *scribbleData = [fileManager contentsAtPath:self.scribblePath];
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        _scribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    return _scribble;
}

- (void)drawRect:(CGRect)rect {
    if (!_realImage) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 10);
        const CGFloat dashLengths[2] = {10, 3};
        CGContextSetLineDash(context, 3, dashLengths, 2);
        CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
        CGContextSetFillColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        if (!_loadingThreadHasLaunched) {
            [self performSelectorInBackground:@selector(forwardImageLoadingThread) withObject:nil];
            _loadingThreadHasLaunched = YES;
        }
    } else {
        [_realImage drawInRect:rect];
    }
}

- (void)forwardImageLoadingThread {
    [self image];
    [self performSelectorInBackground:@selector(setNeedsDisplay) withObject:nil];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.touchCommand execute];
}

@end
