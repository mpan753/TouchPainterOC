//
//  ScribbleThumbnailCell.h
//  TouchPainterOC
//
//  Created by Mia on 2/28/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScribbleThumbnailCell : UITableViewCell

+ (NSInteger) numberOfPlaceHolders;
- (void) addThumbnailView:(UIView *)thumbnailView atIndex:(NSInteger)index;

@end
