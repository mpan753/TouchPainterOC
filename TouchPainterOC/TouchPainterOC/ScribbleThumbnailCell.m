//
//  ScribbleThumbnailCell.m
//  TouchPainterOC
//
//  Created by Mia on 2/28/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "ScribbleThumbnailCell.h"

@implementation ScribbleThumbnailCell

+ (NSInteger)numberOfPlaceHolders {
    return 3;
}

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)addThumbnailView:(UIView *)thumbnailView atIndex:(NSInteger)index {
    if (!index) {
        for (UIView *v in [self contentView].subviews) {
            [v removeFromSuperview];
        }
    }
    
    if (index < [ScribbleThumbnailCell numberOfPlaceHolders]) {
        CGFloat x = index *90 + (index + 1) *12;
        CGFloat y = 10;
        CGFloat width = 90;
        CGFloat height = 130;
        
        thumbnailView.frame = CGRectMake(x, y, width, height);
        [self.contentView addSubview:thumbnailView];
    }
}

@end
