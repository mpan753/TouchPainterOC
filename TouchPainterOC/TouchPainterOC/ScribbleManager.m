//
//  ScribbleManager.m
//  TouchPainterOC
//
//  Created by Mia on 2/27/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "ScribbleManager.h"
#import "ScribbleMemento.h"
#import "CoordinatingViewController.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@interface ScribbleManager ()

- (NSInteger) numberOfScribbles;

- (NSString *) scribbleDataPath;
- (NSString *) scribbleThumbnailPath;
- (NSArray *) scribbleDataPaths;
- (NSArray *) scribbleThumbnailPaths;

@end

@implementation ScribbleManager

- (void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image {
    NSInteger newIndex = [self numberOfScribbles] + 1;
    
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%ld", newIndex];
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *scribbleData = [scribbleMemento data];
    NSString *mementoPath = [[self scribbleDataPath] stringByAppendingPathComponent:scribbleDataName];
    [scribbleData writeToFile:mementoPath atomically:YES];
    
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%ld", (long)newIndex];
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagePath = [[self scribbleThumbnailPath] stringByAppendingPathComponent:scribbleThumbnailName];
    [imageData writeToFile:imagePath atomically:YES];
}

- (NSInteger)numberOfScribbles {
    return [self scribbleThumbnailPaths].count;
}

- (NSString *)scribbleDataPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleDataPath]) {
        [fileManager createDirectoryAtPath:kScribbleDataPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return kScribbleDataPath;
}

- (NSArray *)scribbleDataPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    return  [fileManager contentsOfDirectoryAtPath:[self scribbleDataPath] error:&error];
}

- (NSString *)scribbleThumbnailPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleThumbnailPath]) {
        [fileManager createDirectoryAtPath:kScribbleThumbnailPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return kScribbleThumbnailPath;
}

- (NSArray *)scribbleThumbnailPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    return [fileManager contentsOfDirectoryAtPath:[self scribbleThumbnailPath] error:&error];
}

//- (UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index {
//    
//}

@end
